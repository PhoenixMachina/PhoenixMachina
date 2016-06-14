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
    if length(SapphireORM.get(conn,Dict("table" => "users",
                                       "where" => "username='$username'"))) > 0
        addArg(registerPage, "error", "Ce nom d'utilisateur est déjà pris.")
        Response(render(registerPage))
    end

    #If the mail already exist
    if length(SapphireORM.get(conn,Dict("table" => "users",
                                       "where" => "mail='$mail'"))) > 0
        addArg(registerPage, "error", "L'addresse e-mail $mail est déjà liée à un compte.")
        Response(render(registerPage))
    end
    addUser(username, password, mail)
   else
     addArg(registerPage, "error", "Erreur, vous n'avez pas remplis tous les champs ou avez oublié d'accepter les CGU")
   end
  Response(render(registerPage))
end
