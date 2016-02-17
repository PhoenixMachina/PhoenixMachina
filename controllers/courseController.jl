function getContent(req::Request, res::Response)
  homePage = Page("C:/Users/Nathanael/Desktop/julia/PhoenixMachina/views/course.html",Dict())
  Response(render(homePage))
end

function postContent(req::Request, res::Response)
  Response("Vous êtes en état d'arrestation. HAUT LES MAINS")
end
