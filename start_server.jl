# Imports
using HttpServer
using Logging
using MySQL

# Required files
include("config.jl")
include("include/ResponseHandler.jl")

function connectToDatabase()   # Starting Database connexion
  try
    global con = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
  catch
    critical("Failed to connect to the database.")
  end
end

function startServer() # Starts server
  try
    server = Server( http )
    run( server, 8000 )
  catch error
    critical("Failed to start server. Error : $error")
  end
end

# Starting URL Routing
http = HttpHandler() do req::Request, res::Response
  if ismatch(r"PhoenixMachina$",req.resource)||ismatch(r"PhoenixMachina/$",req.resource) # Home controller
    include(string(HOME_URL,"controllers/",HOME_CONTROLLER))
    if isempty(req.data)
      getContent(req,res)
    else
      postContent(req,res)
    end

  elseif ismatch(r"^/PhoenixMachina/",req.resource) # Other controller
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
  end # Ends regex conditions
end  # Ends do

# Starting services
connectToDatabase()
startServer()
