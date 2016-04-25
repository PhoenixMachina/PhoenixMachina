using Base.Test
using SapphireORM

include("../config.jl")
global conn = Sapphire(username=DB_USER, password=DB_PASSWORD, dbname=DB_NAME)

#TODO add here data for the database to test getters
include("CourseModuleTest.jl")
include("CourseEditorModuleTest.jl")
