function getContent(req::Request, res::Response)
  homePage = Page("C:/Users/Nathanael/Desktop/julia/PhoenixMachina/views/home.html",Dict())
  Response(render(homePage))
end

function postContent(req::Request, res::Response)
  getContent(req,res)
end
