function getContent(req::Request, res::Response)
  cEdPage = Page(tlaloc,"courseEditor.html",Dict())
  addArg(cEdPage, "pageTitle", "Editeur de cours")
  Response(render(cEdPage))
end

function postContent(req::Request, res::Response)
  getContent(req,res)
end
