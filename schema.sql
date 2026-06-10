--###DATABASE SCHEMA###
--!!!STUDENT MANAGEMENT SYSTEM!!!




-- DEPARTMENTS TABLE

CREATE TABLE departments (
  DepartmentID int NOT NULL,
  DepartmentName varchar(100) NOT NULL,
  PRIMARY KEY (DepartmentID)
);


-- STUDENTS TABLE

CREATE TABLE students (
  studentid int NOT NULL,
  email varchar(50) DEFAULT NULL,
  departmentid int DEFAULT NULL,
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  PRIMARY KEY (studentid),
  UNIQUE KEY email (email),
  KEY departmentid (departmentid),
  CONSTRAINT students_ibfk_1 FOREIGN KEY (departmentid)
  REFERENCES departments (DepartmentID)
  ON DELETE SET NULL ON UPDATE CASCADE
);


-- LECTURERS TABLE

CREATE TABLE lecturers (
  lecturerid int NOT NULL,
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  departmentid int DEFAULT NULL,
  PRIMARY KEY (lecturerid),
  KEY departmentid (departmentid),
  CONSTRAINT lecturers_ibfk_1 FOREIGN KEY (departmentid)
  REFERENCES departments (DepartmentID)
  ON DELETE SET NULL ON UPDATE CASCADE
);

-- COURSES TABLE

CREATE TABLE courses (
  CourseID int NOT NULL,
  CourseName varchar(100) DEFAULT NULL,
  LecturerID int DEFAULT NULL,
  PRIMARY KEY (CourseID),
  KEY LecturerID (LecturerID),
  CONSTRAINT courses_ibfk_1 FOREIGN KEY (LecturerID)
  REFERENCES lecturers (lecturerid)
  ON DELETE CASCADE ON UPDATE CASCADE
);


-- ENROLMENTS TABLE

CREATE TABLE enrolments (
  enrolmentid int NOT NULL,
  studentid int DEFAULT NULL,
  courseid int DEFAULT NULL,
  PRIMARY KEY (enrolmentid)
);


-- GRADES TABLE

CREATE TABLE grades (
  gradeid int NOT NULL,
  enrolmentid int DEFAULT NULL,
  grade varchar(2) DEFAULT NULL,
  gradepoint decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (gradeid)
);


--===FOREIGN KEY CONSTRAINT===

ALTER TABLE enrolments
ADD CONSTRAINT fk_student
FOREIGN KEY (studentid) REFERENCES students(studentid);

ALTER TABLE enrolments
ADD CONSTRAINT fk_course
FOREIGN KEY (courseid) REFERENCES courses(CourseID);

ALTER TABLE grades
ADD CONSTRAINT fk_enrolment
FOREIGN KEY (enrolmentid) REFERENCES enrolments(enrolmentid);
