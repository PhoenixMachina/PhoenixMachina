module CourseModule

  type Course
    id::Int16
    name::ASCIIString
    logo::ASCIIString
    category::ASCIIString
    tags::ASCIIString
    level::ASCIIString
    introduction::ASCIIString
    conclusion::ASCIIString
    lastUpdated

    function Course(id::Int16,name::ASCIIString="")
      # Should here be a call to SapphireORM
      new(id,name,logo,category,tags,level,introduction,conclusion,lastUpdated)
    end

  end

end
