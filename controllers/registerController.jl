function getContent(req::Request, res::Response)
  registerPage = Page("main.html","register.html",Dict())
  Response(getParsedContent(registerPage))
end

function postContent(req::Request, res::Response)
  for n in eachindex(foo)
    global pseudo = foo[n][1] == "pseudo" ? foo[n][2] : isdefined(:pseudo) ? pseudo : ""
    global password = foo[n][1] == "password" ? foo[n][2] : isdefined(:password) ? password : ""
    global mail = foo[n][1] == "mail" ? foo[n][2] : isdefined(:mail) ? mail : ""
  end
  registerPage = Page("main.html","register.html",Dict())
  if !is_null(pseudo) && !is_null(password) && !is_null(mail)
    println("pseudo: ", pseudo)
    println("password: ", password)
    println("mail: ", mail)
   else
    critical("Have you defined all inputs ?")
   end
  Response(getParsedContent(registerPage))
end
