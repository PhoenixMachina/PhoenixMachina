using CourseModule

# Testing constructor
course = Course(1,"This is a course","logo.jpg","Random Category","aTag,anotherOne","Beginner","Hey Guys!","Bye bye guys!","01/01/1970")
@test typeof(course) == Course
@test (course.attributes)["name"] == "This is a course"

# Trying to retrieve course
lcourse = getCourse(conn,1)
@test (lcourse.attributes)["id"] == 1
@test (lcourse.attributes)["logo"] == "logo.jpg"
