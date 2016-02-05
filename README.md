# PhoenixMachina

## Backend requirements

### Packages
You need to have install the following Julia packages on your computer :
- HttpServer
- Logging

To install a package, open a Julia console, and type Pkg.add("PACKAGE_NAME")

You also need a package with the MySQL driver. To download it, type Pkg.clone("https://github.com/JuliaComputing/MySQL.jl")

### Database
You need to create a database phoenixmachina and import the file phoenixmachina.sql which contains the tables you'll need.

## Settings
### Required
You need to set a few variables in config.jl; the required ones are specified.

## Start
Launch start_server.jl. You should see "Listening on 0.0.0.0:8000..."

You then just need to open your browser and type localhost:8000/PhoenixMachina

## Contributing
### Implemented features
- Page manager

### Coming soon features
- Access to courses

- Course editor

### Participating
If you want to join in, feel free to!

We have a slack account for the team which we'll give you access to once you've made your first pull request.
