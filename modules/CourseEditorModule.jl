module CourseEditorModule
  export tagCourse,unTagCourse,changeCourseAttribute

  using CourseModule

  # Tags a course
  function tagCourse(course::Course,tag::ASCIIString)
    (course.attributes)["tags"] = string((course.attributes)["tags"],",",tag)
  end

  # Untags course
  function unTagCourse(course::Course,tag::ASCIIString)
    tagMatch = match(Regex(tag),(course.attributes)["tags"])
    if tagMatch == nothing # if there's no match
      return false
    end
    if tagMatch.offset + length(tag) == length((course.attributes)["tags"]) # if it's the last tag
      (course.attributes)["tags"] = ((course.attributes)["tags"])[1:tagMatch.offset]
    else
      (course.attributes)["tags"] = string(((course.attributes)["tags"])[1:tagMatch.offset-1],((course.attributes)["tags"])[tagMatch.offset+length(tag)+1:end])   # otherwhise we'll cut the tag from the rest without forgetting the comma
    end
    return true
  end

  # Change name
  function changeCourseAttribute(course::Course,attribute,newValue)
     (course.attributes)[attribute] = newValue
  end

end
