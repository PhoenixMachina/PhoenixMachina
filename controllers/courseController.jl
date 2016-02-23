function getContent(req::Request, res::Response)
  coursePage = Page(tlaloc,"course.html",Dict())
  Response(render(coursePage))
end

function postContent(req::Request, res::Response)
  getContent(req,res)
end
