function getContent(req::Request, res::Response)
  registerPage = Page("main.html","register.html",Dict())
  Response(getParsedContent(registerPage))
end

function postContent(req::Request, res::Response)

end
