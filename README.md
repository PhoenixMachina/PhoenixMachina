# PhoenixMachina

## Backend requirements

### Packages
You need to have install the following Julia packages on your computer :
- HttpServer

To install a package, open a Julia console, and type Pkg.add("PACKAGE_NAME")

You also need a package with the MySQL driver. To download it, type Pkg.clone("https://github.com/JuliaComputing/MySQL.jl")

### Database
You need to create a database phoenixmachina and import the file phoenixmachina.sql which contains the tables you'll need.

## Settings
### Required
You need to set a few variables in config.jl; the required ones are specified.

## Start
Launch start_server.jl. You should see "Listening to "...

You then just need to open your browser and type localhost:8000/PhoenixMachina
