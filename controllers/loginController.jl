function getContent(req::Request, res::Response)
  loginPage = Page("main.html","login.html",Dict())
  Response(getParsedContent(loginPage))
end

function postContent(req::Request, res::Response)
  loginPage = Page("main.html","login.html",Dict())
  # Set post variables
  username = ""
  password = ""
  # Check all values of post requests
  for n in eachindex(foo)
    username = foo[n][1] == "username" ? foo[n][2] : !is_null(username) ? username : ""
    password = foo[n][1] == "password" ? foo[n][2] : !is_null(password) ? password : ""
  end
  if !is_null(username) && !is_null(password)
    # Check all users added in the table
    sql = "SELECT * FROM users;"
    usersTable = mysql_execute_query(con, sql; opformat=MYSQL_TUPLES)
    for row in eachindex(usersTable)
      # usersTable[row][2]: name
      # usersTable[row][3]: password
      # usersTable[row][5]: email
      if ( username == usersTable[row][2] || username == usersTable[row][5] ) && password == usersTable[row][3]
        println("Login successfully")
      else
        err("Wrong user/password")
      end
    end
   else
    err("Have you defined all inputs ?")
   end
  Response(getParsedContent(loginPage))
end
