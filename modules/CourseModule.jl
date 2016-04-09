module CourseModule

  export Course

  type Course

    attributes::Dict

    function Course(id,name::ASCIIString="",logo::ASCIIString="default.jpg",category::ASCIIString="",tags::ASCIIString="",level::ASCIIString="Beginner",introduction::ASCIIString="",conclusion::ASCIIString="",lastUpdated="00/00/0000")
      new(Dict("id"=>id,"name"=>name,"logo"=>logo,"category"=>category,"tags"=>tags,"level"=>level,"introduction"=>introduction,"conclusion"=>conclusion,"lastUpdated"=>lastUpdated))
    end

  end

end
