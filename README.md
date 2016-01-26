# PhoenixMachina

## Backend requirements

### Packages
You need to have install the following Julia packages on your computer :
- HttpServer

To install, open a Julia console, and type Pkg.add("HttpServer")

### Database
You need to create a database phoenixmachina and import the file phoenixmachina.sql which contains the tables you'll need.

## Settings
### Required
The path variable in config.jl must be set to your path

## Start
Launch start_server.jl. You should see "Listening to "...

You then just need to open your browser and type localhost:8000/PhoenixMachina
