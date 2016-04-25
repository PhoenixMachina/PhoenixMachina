module CourseModule

  export Course,CoursePart,CourseChapter,getCourse

  using SapphireORM
  type Course

    attributes::Dict

    function Course(id,name="",logo="default.jpg",category="",tags="",level="Beginner",introduction="",conclusion="",lastUpdated="00/00/0000")
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

  function getCourse(conn,id)
    course_data = SapphireORM.get(conn,Dict("table" => "courses",
                                     "where" => "id='$id'"))
    course = Course(course_data[1][1],
                    course_data[2][1],
                    course_data[3][1],
                    course_data[4][1],
                    course_data[5][1],
                    course_data[6][1],
                    course_data[7][1],
                    course_data[8][1],
                    course_data[9][1])
    return course
  end

end
