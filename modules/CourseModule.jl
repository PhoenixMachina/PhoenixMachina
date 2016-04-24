module CourseModule

  export Course,CoursePart,CourseChapter,getCourse

  type Course

    attributes::Dict

    function Course(id,name::ASCIIString="",logo::ASCIIString="default.jpg",category::ASCIIString="",tags::ASCIIString="",level::ASCIIString="Beginner",introduction::ASCIIString="",conclusion::ASCIIString="",lastUpdated="00/00/0000")
      new(Dict("id"=>id,
              "name"=>name,
              "logo"=>logo,
              "category"=>category,
              "tags"=>tags,
              "level"=>level,
              "introduction"=>introduction,
              "conclusion"=>conclusion,
              "lastUpdated"=>lastUpdated))
    end

  end

  type CoursePart
    attributes::Dict
    function CoursePart(id,course_id,name,order)
      new(Dict("id"=>id,
                "course_id"=>course_id,
                "name"=>name,
                "order"=>order))
    end
  end
  type CourseChapter
    attributes::Dict
    function CourseChapter(id,part_id,order,name,current_commit)
      new(Dict("id"=>id,
                "part_id"=>part_id,
                "order"=>order,
                "name"=>name,
                "current_commit"=>current_commit))
    end
  end

  function getCourse(id)
    course_data = SapphireORM.get(conn,Dict("table" => "courses",
                                     "where" => "id='$id'"))
  end

end
