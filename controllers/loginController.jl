function getContent(req::Request, res::Response)
  loginPage = Page("main.html","login.html",Dict())
  Response(getParsedContent(loginPage))
end

function postContent(req::Request, res::Response)

end
