function getContent(req::Request, res::Response)
  registerPage = Page("C:/Users/Nathanael/Desktop/julia/PhoenixMachina/views/register.html",Dict())
  Response(render(registerPage))
end

function postContent(req::Request, res::Response)
  registerPage = Page("main.html","register.html",Dict())
  # Set post variables
  pseudo = ""
  password = ""
  mail = ""
  # Check all values of post requests
  for n in eachindex(foo)
    pseudo = foo[n][1] == "pseudo" ? foo[n][2] : !is_null(pseudo) ? pseudo : ""
    password = foo[n][1] == "password" ? foo[n][2] : !is_null(password) ? password : ""
    mail = foo[n][1] == "mail" ? foo[n][2] : !is_null(mail) ? mail : ""
  end
  if !is_null(pseudo) && !is_null(password) && !is_null(mail)
    # Check all users added in the table
    sql = "SELECT * FROM users;"
    usersTable = mysql_execute_query(con, sql; opformat=MYSQL_TUPLES)
    for row in eachindex(usersTable)
      # usersTable[row][2]: name
      # usersTable[row][5]: email
      if pseudo == usersTable[row][2] || mail == usersTable[row][5]
        err("User already exist")
      else
        mysql_execute_query(con, "INSERT INTO users (username, password, email) values (\"$pseudo\", \"$password\", \"$mail\");")
      end
    end
   else
    err("Have you defined all inputs ?")
   end
  Response(getParsedContent(registerPage))
end
