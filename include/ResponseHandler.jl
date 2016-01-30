# This function parses the view by adding the defined variables into the HTML
# @Arg the HTML Code
# @Return the HTML Code parsed
function parseView(response)
difference = 0 # We need this because eachMatch collects all the match and then treats them, which means the data concerning indexes starting from the second match needs to be adjsted
  for match in eachmatch(r"\$\{([a-zA-Z0-9_]+)\}",response)
    if isdefined(symbol((match.match)[3:end-1]))
      var = @eval ($(symbol((match.match)[3:end-1])))
      response = string(response[1:(match.offset)-1 + difference],var,response[((match.offset)+difference+(length(match.match))):end] )
      difference = difference + length(var) - length(match.match)
    end
  end

  return response
end
