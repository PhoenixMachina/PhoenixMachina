function parseView(response)
  for match in eachmatch(r"\$\{([a-zA-Z0-9_]+)\}",response)
    if isdefined(symbol((match.match)[3:end-1]))
      var = @eval ($(symbol((match.match)[3:end-1])))
      response = string(response[1:(match.offset)],var,response[((match.offset)+(length(match.match))):end] )
    end
  end

  return response
end
