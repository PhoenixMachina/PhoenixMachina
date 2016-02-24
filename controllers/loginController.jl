function getContent(req::Request, res::Response)
  loginPage = Page(tlaloc,"login.html",Dict())
  Response(render(loginPage))
end

function postContent(req::Request, res::Response)
  loginPage = Page(tlaloc,"login.html",Dict())
  loadModule("user")

  if(haskey(dataPost, "username") && dataPost["username"] != "" && haskey(dataPost, "password") && dataPost["password"] != "")

    users = SapphireORM.get(conn,Dict("table" => "users"))

    for test in eachrow(users)
  #    print(test)
    end
   else
    err("Have you defined all inputs ?")
   end
  Response(render(loginPage))
end
