function getContent(req::Request, res::Response)
  registerPage = Page("main.html","register.html",Dict())
  Response(getParsedContent(registerPage))
end

function postContent(req::Request, res::Response)
  # Check all values of post requests
  for n in eachindex(foo)
    global pseudo = foo[n][1] == "pseudo" ? foo[n][2] : !is_null(pseudo) ? pseudo : ""
    global password = foo[n][1] == "password" ? foo[n][2] : !is_null(password) ? password : ""
    global mail = foo[n][1] == "mail" ? foo[n][2] : !is_null(mail) ? mail : ""
  end
  registerPage = Page("main.html","register.html",Dict())
  if !is_null(pseudo) && !is_null(password) && !is_null(mail)
    # etc...
   else
    critical("Have you defined all inputs ?")
   end
  Response(getParsedContent(registerPage))
end
