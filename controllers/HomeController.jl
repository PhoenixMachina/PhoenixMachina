function getContent(req::Request, res::Response)
  homePage = Page("","home.html",Dict())
  Response(getParsedContent(homePage))
end

function postContent(req::Request, res::Response)
  Response("Vous êtes en état d'arrestation. HAUT LES MAINS")
end
