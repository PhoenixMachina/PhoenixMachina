function getContent(req::Request, res::Response)
  registerPage = Page("main.html","register.html",Dict())
  Response(getParsedContent(registerPage))
end

function postContent(req::Request, res::Response)
  Response("You might be able to register here one day")
end
