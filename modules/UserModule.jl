module UserModule
  type User
    id::Int16
    username::AbstractString
    email::AbstractString
    rank::Int16

    # Constructor
    function User(id::Int16,username::AbstractString,email::AbstractString,rank::Int16)
      new(id,username,email,rank)
    end

  end
end

function checkUser(username::AbstractString, password::AbstractString)
  return SapphireORM.get(conn,Dict("table" => "users",
                                   "where" => "username='$username' AND password='$password'"))
end

function addUser(username::AbstractString, password::AbstractString, mail::AbstractString)
  return SapphireORM.insert(conn,Dict("table" => "users",
                                      "values" => Dict("username" => username,
                                                       "password" => sha1(sha1(password)),
                                                       "mail" => mail)))                                 
end
