# is_null() checks if the variable chosen is empty
function is_null(arg::Any)
  arg = replace(arg, " ", "") # Delete space
  return arg == "" || arg == 0 ? true : false
end

# loadModule() load a module
function loadModule(moduleName::ASCIIString)
  moduleName = lowercase(moduleName)
  moduleName = ucfirst(moduleName)
  include("modules/" * moduleName * "Module.jl")
end
