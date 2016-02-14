function getContent(req::Request, res::Response)
  loginPage = Page("main.html","cgu.html",Dict())
  Response(getParsedContent(loginPage))
end
function postContent(req::Request, res::Response)
  getContent(req,res)
end
