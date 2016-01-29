function parseView(response)
  for match in eachmatch(r"\$\{([a-zA-Z0-9_]+)\}",response)
    if isdefined(symbol((match.match)[3:end-1]))
      response = string(response[1:(match.offset)]),@eval ($(symbol((match.match)[3:end-1]))),response[((match.offset)+(length(match.match))):end] )
    end
  end

  return response
end
