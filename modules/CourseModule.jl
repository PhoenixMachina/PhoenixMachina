module CourseModule

  export Course,CoursePart,CourseChapter,getCourse

  type Course

    attributes::Dict

    function Course(id,name::ASCIIString="",logo::ASCIIString="default.jpg",category::ASCIIString="",tags::ASCIIString="",level::ASCIIString="Beginner",introduction::ASCIIString="",conclusion::ASCIIString="",lastUpdated="00/00/0000")
      new(Dict("id"=>id,"name"=>name,"logo"=>logo,"category"=>category,"tags"=>tags,"level"=>level,"introduction"=>introduction,"conclusion"=>conclusion,"lastUpdated"=>lastUpdated))
    end

  end

  type CoursePart
  end
  type CourseChapter
  end

  function getCourse(id)
    course_data = SapphireORM.get(conn,Dict("table" => "courses",
                                     "where" => "id='$id'"))
  end

end
