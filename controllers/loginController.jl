function getContent(req::Request, res::Response)
  loginPage = Page(tlaloc,"login.html",Dict())
  addArg(loginPage, "error", "")
  Response(render(loginPage))
end

function postContent(req::Request, res::Response)
  loginPage = Page(tlaloc,"login.html",Dict())
  loadModule("user")
  if haskey(dataPost, "username") && dataPost["username"] != "" && haskey(dataPost, "password") && dataPost["password"] != ""
    if length(checkUser(dataPost["username"], sha1(sha1(dataPost["password"])))) == 1
      Response(render(loginPage))
    else
      addArg(loginPage, "error", "Le nom d'utilisateur et le mot de passe ne correspondent pas.")
    end
  else
    addArg(loginPage, "error", "Certains champs sont vides")
  end
  Response(render(loginPage))
end
