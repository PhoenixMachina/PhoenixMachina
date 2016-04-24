using CourseEditorModule
using CourseModule

course = Course(1,"This is a course","logo.jpg","Random Category","aTag,anotherOne","Beginner","Hey Guys!","Bye bye guys!","01/01/1970")

# Testing tag function
@test (course.attributes)["tags"] == "aTag,anotherOne"
tagCourse(course,"newTag")
@test (course.attributes)["tags"] == "aTag,anotherOne,newTag"

# Testing untag function
unTagCourse(course,"anotherOne")
@test (course.attributes)["tags"] == "aTag,newTag"

# Testing changeCourseAttribute
changeCourseAttribute(course,"name","NewName")
@test (course.attributes)["name"] == "NewName"

# Trying to save a course
saveCourse(conn,course)
