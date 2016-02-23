# Imports
using HttpServer
using HttpCommon
using Logging
using SapphireORM
using Tlaloc

# Required files
include("config.jl")
include("include/functions.jl")

function connectToDatabase()   # Starting Database connexion
  try
    global con = Sapphire(username=DB_USER, password=DB_PASSWORD, dbname=DB_NAME)
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
    if isfile(string(HOME_URL,"controllers/",(m.match)[17:end],"Controller.jl"))
      include(string(HOME_URL,"controllers/",(m.match)[17:end],"Controller.jl"))
      if isempty(req.data)
        getContent(req,res)
      else
        global dataPost = "" # Reset
        global foo = []
        for n in eachindex(req.data)
          global dataPost = string(dataPost, Char(req.data[n]))
        end
        global dataPost = split(dataPost, "&")
        for n in eachindex(dataPost)
          push!(foo, split(dataPost[n], "="))
        end
        postContent(req,res)
      end
    else
      if ismatch(r"^/PhoenixMachina/resources/",req.resource) #Access to a ressource page
        if !ismatch(r"^/PhoenixMachina\/resources\/([a-zA-Z0-9./]+)",req.resource)
          Response("404")
        else
          # Check if file exists, if yes, returns it
          m2 = match(r"^/PhoenixMachina\/resources\/([a-zA-Z0-9./]+)",req.resource)
          if isfile(string(HOME_URL,(m2.match)[17:end]))
            headers = Headers(
            "Server"            => "Julia/$VERSION",
            "Content-Type"      => "text/css; charset=utf-8",
            "Content-Language"  => "fr",
            "Date"              => Dates.format(now(Dates.UTC), Dates.RFC1123Format) )
            Response(open(readall,string(HOME_URL,(m2.match)[17:end])),headers)
          else
            Response("404")
          end
        end
      else
        Response("404")
      end
    end
  else
    Response("404")
  end # Ends regex conditions
end  # Ends do

global tlaloc = Tlaloc(string(HOME_URL,"include/tlaloc.ini"))
# Starting services
connectToDatabase()
startServer()
