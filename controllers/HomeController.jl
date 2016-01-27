function getContent(req::Request, res::Response)
  response =  open(readall,string(HOME_URL,"views/home.html"));
  Response(parseView(response))
end

function postContent(req::Request, res::Response)
  Response("Vous êtes en état d'arrestation. HAUT LES MAINS")
end
