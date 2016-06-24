function getContent(req::Request, res::Response)
  registerPage = Page(tlaloc,"register.html",Dict())
  addArg(registerPage, "error", "")
  addArg(registerPage, "pageTitle", "Inscription")
  Response(render(registerPage))
end

function postContent(req::Request, res::Response)
  registerPage = Page(tlaloc,"register.html",Dict())
  if haskey(dataPost, "cgu") && haskey(dataPost, "username") && dataPost["username"] != "" && haskey(dataPost, "password") && dataPost["password"] != "" && haskey(dataPost, "mail") && dataPost["mail"] != ""
    loadModule("user")
    username = dataPost["username"]
    password = dataPost["password"]
    mail = dataPost["mail"]

    # If the username already exist
    if nrow(SapphireORM.get(conn,Dict("table" => "users",
                                       "where" => "username='$username'"))) > 0
        addArg(registerPage, "error", "Ce nom d'utilisateur est deja pris.")
    elseif nrow(SapphireORM.get(conn,Dict("table" => "users",
                                       "where" => "mail='$mail'"))) > 0
        addArg(registerPage, "error", "Cette addresse e-mail est deja liee a un compte.")
    else
      addUser(username, password, mail)
    end
  else
     addArg(registerPage, "error", "Erreur, vous n'avez pas remplis tous les champs ou avez oublie d'accepter les CGU")
  end
  Response(render(registerPage))
end
