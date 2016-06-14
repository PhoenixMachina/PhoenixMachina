# PhoenixMachina
[![Build Status](https://travis-ci.org/PhoenixMachina/PhoenixMachina.svg?branch=master)](https://travis-ci.org/PhoenixMachina/PhoenixMachina)
[![Licence MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Installing PhoenixMachina on Linux
You'll first need to have MySQL installed on your computer and added the phoenixmachina.sql file to your database.
We have a script to install everything else at once that you can find here : https://github.com/PhoenixMachina/launcher-linux

## Installing PhoenixMachina on OSX
Sorry, we don't like OSX. Go away.

## Installing PhoenixMachina on Windows
### Julia dependencies
Just run install.jl to download all necessary packages.

You also need our ORM : Pkg.clone("https://github.com/PhoenixMachina/SapphireORM")
and our Template Engine : Pkg.clone("https://github.com/PhoenixMachina/Tlaloc")
You might have a problem with "MySQL library not found error". The error comes from above, look here to find the answer you're looking for : https://github.com/JuliaDB/MySQL.jl

### Database
You need to have MySQL installed on your computer as well as a driver, create a database phoenixmachina and import the file phoenixmachina.sql which contains the tables you'll need.

### Settings
There are two files you need to create: config.jl in the main folder, and tlaloc.ini in the include folder. Here are their contents, which you need to change depending on your environment:
config.jl :
```
#REQUIRED

#Home URLS
HOME_CONTROLLER = "HomeController.jl"
HOME_URL = "/path/to/PhoenixMachina/"

DB_DSN = "MySQL_database"
DB_USER = ""
DB_PASSWORD = ""

#OPTIONAL
Logging.configure(output=open("/path/to/project/logfile.log", "a"))
```
tlaloc.ini
```
viewPath=/path/to/PhoenixMachina/views/
templatePath=/path/to/PhoenixMachina/templates/
resourcePath=/path/to/PhoenixMachina/resources/
```

## Start
Launch start_server.jl. You should see "Listening on 0.0.0.0:8000..."

You then just need to open your browser and type localhost:8000/PhoenixMachina/ (the slash at the end is currently necessary)

## Contributing
### Implemented features
- Router

- Login and signup

### Coming soon features
- Access to courses

- Course editor

### Participating
If you want to join in, feel free to!

We have a slack account for the team which we'll give you access to once you've made your first pull request.

Also, don't hesitate to add issues on GitHub, we won't eat you :)
