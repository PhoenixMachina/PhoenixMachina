export Page

#Type Page
type Page
  template::ASCIIString # Template used for page (contains header & footer)
  view::ASCIIString # Contains body
  args::Dict # Arguments sent by Julia that need to be added into the body

  #Constructor
  function Page(template::ASCIIString,view::ASCIIString,args::Dict)
    template = string( "templates/",template)
    view = string("views/", view)
    new(template,view,args)
  end

end

#Tools associated with the Page type


# Adds arguments to page
function addArg(page::Page,name::ASCIIString,value::ASCIIString)
  push!(page.args,(name=>value))
end

# This function parses the view by adding the defined variables into the HTML
function parseView(page::Page)
  content = getContent(page)
  response = content
  difference = 0 # We need this because eachMatch collects all the match and then treats them, which means the data concerning indexes starting from the second match needs to be adjsted
  for match in eachmatch(r"\$\{([a-zA-Z0-9_]+)\}",content)
    if isdefined(symbol((match.match)[3:end-1]))
      var = @eval ($(symbol((match.match)[3:end-1])))
      response = string(response[1:(match.offset)-1 + difference],var,response[((match.offset)+difference+(length(match.match))):end] )
      difference = difference + length(var) - length(match.match)
    elseif haskey(page.args,(match.match)[3:end-1])
      var = (page.args)[(match.match)[3:end-1]]
      response = string(response[1:(match.offset)-1 + difference],var,response[((match.offset)+difference+(length(match.match))):end] )
      difference = difference + length(var) - length(match.match)
    end
  end

  return response
end

# Gets content
function getContent(page::Page)
  bodyContent = open(readall,string(HOME_URL,page.view))
  if page.template == "templates/"
    return bodyContent
  end
  templateContent = open(readall,string(HOME_URL,page.template))
  bodyMarker = match(r"<body>",templateContent)
  content = string(templateContent[1:bodyMarker.offset+6],bodyContent,templateContent[bodyMarker.offset + 6 : end])
  return content
end

# Gets final content
function getParsedContent(page::Page)
  return parseView(page)
end
