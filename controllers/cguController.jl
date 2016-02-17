function getContent(req::Request, res::Response)
  cguPage = Page("C:/Users/Nathanael/Desktop/julia/PhoenixMachina/views/cgu.html",Dict())
  Response(render(cguPage))
end
function postContent(req::Request, res::Response)
  getContent(req,res)
end
