function getContent(req::Request, res::Response)
  coursePage = Page(tlaloc,"course.html",Dict())
  addArg(coursePage, "pageTitle", "Introduction au machine learning")
  addArg(coursePage,"courseName","Introduction au machine learning")
  addArg(coursePage,"courseContent","This is the content")
  Response(render(coursePage))
end

function postContent(req::Request, res::Response)
  getContent(req,res)
end
