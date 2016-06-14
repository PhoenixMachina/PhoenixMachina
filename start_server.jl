# Imports
using HttpServer
using HttpCommon
using Logging
using SapphireORM
using Tlaloc
using SecureSessions
using DataFrames
using SHA
using Yodel

# Required files
include("config.jl")
include("include/functions.jl")

function connectToDatabase()   # Starting Database connexion
  try
    global conn = Sapphire(dsn=DB_DSN, username=DB_USER, password=DB_PASSWORD)
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

  if ismatch(r"^/PhoenixMachina/",req.resource) # Check if URL matches

    m = match(r"^/PhoenixMachina\/([a-zA-Z0-9./]+)",req.resource) # Get full URL

    # Check if URL matches with a route.
    # If it does, get controller and throw an error if it does not exist
    # If it does exist, call the right method
    if isRoute(yodel, string("",(m.match)[17:end]))
      route = getRoute(yodel, string("",(m.match)[17:end]))
      if !isfile(string(HOME_URL,"controllers/",route.controller,".jl"))
        critical("Missing controller")
      end
      include(string(HOME_URL,"controllers/",route.controller,".jl"))

      if isempty(req.data)
        getContent(req,res)
      else
        global dataPost = reqToDict(req.data)
        postContent(req,res)
      end

    # If it isn't a route, check to see if it's a resource.
    # If it isn't, the page does not exist, so send back a 404.
    # If it does exist, send it with the appropriate header.
    elseif ismatch(r"^/PhoenixMachina/resources/",req.resource) #Access to a ressource page
      if !ismatch(r"^/PhoenixMachina\/resources\/([a-zA-Z0-9./]+)",req.resource)
        Response("404")
      else
        resourceMatch = match(r"^/PhoenixMachina\/resources\/([a-zA-Z0-9./]+)",req.resource)
        if isfile(string(HOME_URL,(resourceMatch.match)[17:end]))
          # Get type
          contentType = (resourceMatch.match)[end-((match(r".",req.resource)).offset)+1:end]
          Response(open(readall,string(HOME_URL,(resourceMatch.match)[17:end])),getHeaders(contentType))
        else
          Response("404")
        end
      end
      # If it's neither a route nor a resource, it's nothing.
    else
      Response("404")
    end

  # If it does not have PM in it's URL, then it's asking for another project so send a 404
  else
    Response("404")
  end # Ends regex conditions
end  # Ends do

# Initiating modules
global tlaloc = TlalocEngine(string(HOME_URL,"include/tlaloc.ini"))
global yodel = YodelEngine(string(HOME_URL,"include/routes.xml"))

# Starting services
connectToDatabase()
startServer()
