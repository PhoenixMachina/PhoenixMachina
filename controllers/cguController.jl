function getContent(req::Request, res::Response)
  cguPage = Page(tlaloc,"cgu.html",Dict())
  addArg(cguPage, "pageTitle", "CGU")
  Response(render(cguPage))
end
function postContent(req::Request, res::Response)
  getContent(req,res)
end
