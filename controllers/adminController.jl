function getContent(req::Request, res::Response)
  adminPage = Page(tlaloc,"admin.html",Dict())
  addArg(adminPage, "pageTitle", "Admin Home")
  Response(render(adminPage))
end
function postContent(req::Request, res::Response)
  getContent(req,res)
end
