function getContent(req::Request, res::Response)
  homePage = Page(tlaloc,"courseEditor.html",Dict())
  addArg(homePage, "pageTitle", "Editeur de cours")
  Response(render(homePage))
end

function postContent(req::Request, res::Response)
  getContent(req,res)
end
