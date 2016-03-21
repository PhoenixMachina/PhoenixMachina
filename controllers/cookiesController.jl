function getContent(req::Request, res::Response)
  cookiesPage = Page(tlaloc,"cookies.html",Dict())
  addArg(cookiesPage, "pageTitle", "Cookies")
  Response(render(cookiesPage))
end
function postContent(req::Request, res::Response)
  getContent(req,res)
end
