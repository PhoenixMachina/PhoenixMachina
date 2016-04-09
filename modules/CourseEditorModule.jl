module CourseEditorModule
  export tagCourse,unTagCourse

  using CourseModule

  # Tags a course
  function tagCourse(course::Course,tag::ASCIIString)
    course.tags = string(course.tags,",",tag)
  end

  # Untags course
  function unTagCourse(course::Course,tag::ASCIIString)
    tagMatch = match(Regex(tag),course.tags)
    if tagMatch == nothing # if there's no match
      return false
    end
    if tagMatch.offset + length(tag) == length(course.tags) # if it's the last tag
      course.tags = (course.tags)[1:tagMatch.offset]
    else
      course.tags = string((course.tags)[1:tagMatch.offset-1],(course.tags)[tagMatch.offset+length(tag)+1:end])   # otherwhise we'll cut the tag from the rest without forgetting the comma
    end
    return true
  end

end
