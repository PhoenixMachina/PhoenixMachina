# PhoenixMachina
[![Build Status](https://travis-ci.org/PhoenixMachina/PhoenixMachina.svg?branch=master)](https://travis-ci.org/PhoenixMachina/PhoenixMachina)
[![Licence MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Backend requirements

### Packages
Just run install.jl to download all necessary packages. If you want to do it by hand, you need to install those packages :
- HttpServer
- Logging
- Markdown

To install a package, open a Julia console, and type Pkg.add("PACKAGE_NAME")

You also need our ORM : Pkg.clone("https://github.com/PhoenixMachina/SapphireORM")
and our Template Engine : Pkg.clone("https://github.com/PhoenixMachina/Tlaloc")
You might have a problem with "MySQL library not found error". The error comes from above, look here to find the answer you're looking for : https://github.com/JuliaDB/MySQL.jl

### Database
You need to have MySQL installed on your computer as well as a driver, create a database phoenixmachina and import the file phoenixmachina.sql which contains the tables you'll need.

## Settings
### Required
You need to set a few variables in config.jl; the required ones are specified, as well as the variables in include/tlaloc.ini .

## Start
Launch start_server.jl. You should see "Listening on 0.0.0.0:8000..."

You then just need to open your browser and type localhost:8000/PhoenixMachina

## Contributing
### Implemented features
- Router

### Coming soon features
- Access to courses

- Course editor

### Participating
If you want to join in, feel free to!

We have a slack account for the team which we'll give you access to once you've made your first pull request.

Also, don't hesitate to add issues on GitHub, we won't eat you :)
