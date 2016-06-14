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

# Converts req.data to Dictionnary
function reqToDict(data)
  global dataPost = Dict()
  key = ""
  value = ""
  word = "key"
  for n in eachindex(data)
    char = Char(data[n])
    if char == '='
      word = "value"
    elseif char == '&'
      dataPost[key] = value
      word = "key"
      value = ""
      key = ""
    else
      if word == "key"
        key = string(key, char)
      else
        value = string(value, char)
      end
    end
  end
  if key != "" && value != ""
    dataPost[key] = value
  end
  return dataPost
end

# Get headers
function getHeaders(contentType)
  return Headers(
  "Server"            => "Julia/$VERSION",
  "Content-Type"      => "text/$contentType; charset=utf-8",
  "Content-Language"  => "fr",
  "Date"              => Dates.format(now(Dates.UTC), Dates.RFC1123Format) )
end
