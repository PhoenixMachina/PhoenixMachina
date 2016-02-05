function getContent(req::Request, res::Response)
  response =  open(readall,string(HOME_URL,"views/register.html"));
  template =  open(readall,string(HOME_URL,"templates/main.html"));

  Response(parseView(response))
end

function postContent(req::Request, res::Response)

end
