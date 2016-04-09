using CourseEditorModule
using CourseModule

# Testing constructor
course = Course(1,"This is a course","logo.jpg","Random Category","aTag,anotherOne","Beginner","Hey Guys!","Bye bye guys!","01/01/1970")
@test typeof(course) == Course
@test course.name == "This is a course"

# Testing tag function
@test course.tags == "aTag,anotherOne"
tagCourse(course,"newTag")
@test course.tags == "aTag,anotherOne,newTag"

# Testing untag function
unTagCourse(course,"anotherOne")
@test course.tags == "aTag,newTag"
