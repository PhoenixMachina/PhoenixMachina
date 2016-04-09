module CourseModule
  export Course
  type Course
    id
    name::ASCIIString
    logo::ASCIIString
    category::ASCIIString
    tags::ASCIIString
    level::ASCIIString
    introduction::ASCIIString
    conclusion::ASCIIString
    lastUpdated

    function Course(id,name::ASCIIString="",logo::ASCIIString="default.jpg",category::ASCIIString="",tags::ASCIIString="",level::ASCIIString="Beginner",introduction::ASCIIString="",conclusion::ASCIIString="",lastUpdated="00/00/0000")
      # Should here be a call to SapphireORM
      new(id,name,logo,category,tags,level,introduction,conclusion,lastUpdated)
    end

  end

end
