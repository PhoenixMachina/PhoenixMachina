# is_null() checks if the variable chosen is empty
function is_null(var::Any)
  var = replace(var, " ", "") # Delete space
  return var == "" ? true : false
end
