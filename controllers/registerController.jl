function getContent(req::Request, res::Response)
  response =  open(readall,string(HOME_URL,"views/register.html"));
  Response(response)end

function postContent(req::Request, res::Response)

end
