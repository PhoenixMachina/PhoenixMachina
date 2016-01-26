using HttpServer

include("config.jl")
include("include/ResponseHandler.jl")

http = HttpHandler() do req::Request, res::Response
    if ismatch(r"PhoenixMachina$",req.resource)||ismatch(r"PhoenixMachina/$",req.resource)
      include(string(HOME_URL,"controllers/",HOME_CONTROLLER))
      if isempty(req.data)
        getContent(req,res)
      else
        postContent(req,res)
      end
    elseif ismatch(r"^/PhoenixMachina/",req.resource)
      m = match(r"^/PhoenixMachina\/([a-zA-Z0-9]+)?\/?",req.resource)
      println(m.match)
      if isfile(string(HOME_URL,"controllers/",(m.match)[17:end],"Controller.jl"))
        include(string(HOME_URL,"controllers/",(m.match)[17:end],"Controller.jl"))
        getContent(req,res)
      else
        Response("404")
      end
    else
    Response("404")
    end
end

function startServer()
  server = Server( http )
  run( server, 8000 )
end

startServer()
