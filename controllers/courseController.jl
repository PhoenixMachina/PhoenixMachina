function getContent(req::Request, res::Response)
  coursePage = Page("C:/Users/Nathanael/Desktop/julia/PhoenixMachina/views/course.html",Dict())
  Response(render(coursePage))
end

function postContent(req::Request, res::Response)
  getContent(req,res)
end
