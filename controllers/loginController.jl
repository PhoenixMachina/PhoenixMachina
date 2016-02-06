function getContent(req::Request, res::Response)
  loginPage = Page("main.html","login.html",Dict())
  Response(getParsedContent(loginPage))
end

function postContent(req::Request, res::Response)
  Response("You might be able to log in from here one day. But hey, since you can't register, why are you even on this page?")
end
