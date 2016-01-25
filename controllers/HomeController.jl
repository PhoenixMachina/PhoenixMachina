function getContent(req::Request, res::Response)
  response =  open(readall,string(HOME_URL,HOME_PAGE));
  Response(response)
end

function postContent(req::Request, res::Response)

end
