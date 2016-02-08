# is_null() checks if the variable chosen is empty
function is_null(arg::Any)
  arg = replace(arg, " ", "") # Delete space
  return arg == "" || arg == 0 ? true : false
end
