using ODBC

module Database
	dsn = "localhost"
	user = "root"
	password = ""

	try
		global db = ODBC.connect(dsn, usr=user, pwd=password)
	catch
		println("Failed to connect to the database.")
		exit(0)
	end

end
