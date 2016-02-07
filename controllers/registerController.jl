function getContent(req::Request, res::Response)
  registerPage = Page("main.html","register.html",Dict())
  Response(getParsedContent(registerPage))
end

function postContent(req::Request, res::Response)
  dataPost = "" # Reset
  n = 1
  for n in eachindex(req.data)
    dataPost = string(dataPost,Char(req.data[n]))
  end

  Response("You might be able to register here one day")

end
