function getContent(req::Request, res::Response)
  coursePage = Page("main.html","course.html",Dict())
  Response(getParsedContent(coursePage))
end

function postContent(req::Request, res::Response)
  Response("Vous êtes en état d'arrestation. HAUT LES MAINS")
end
