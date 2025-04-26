Table "Members" {
  member_id int [pk, increment]
  username varchar(50) [unique, not null]
  email varchar(100) [unique, not null]
  password varchar(255) [not null]
  registration_date timestamp [not null, default: `CURRENT_TIMESTAMP`]
  first_name varchar(50) [not null]
  last_name varchar(50) [not null]
}

Table "Courses" {
  course_id int [pk, increment]
  course_name varchar(200) [not null]
  description text
  start_date date
  end_date date
  instructor varchar(100)
}

Table "Categories" {
  category_id smallint [pk, increment]
  category_name varchar(100) [not null]
}

Table "CourseCategories" {
  course_category_id int [pk, increment]
  course_id int [not null]
  category_id smallint [not null]
}

Table "Enrollments" {
  enrollment_id int [pk, increment]
  member_id int [not null]
  course_id int [not null]
  enrollment_date timestamp [default: `CURRENT_TIMESTAMP`]
}

Table "Certificates" {
  certificate_id int [pk, increment]
  certificate_code varchar(100) [unique, not null]
  issue_date date [not null]
}

Table "CertificateAssignments" {
  certificate_assignment_id int [pk, increment]
  member_id int [not null]
  certificate_id int [not null]
  assignment_date timestamp [default: `CURRENT_TIMESTAMP`]
}

Table "BlogPosts" {
  blog_post_id int [pk, increment]
  title varchar(255) [not null]
  content text [not null]
  publish_date timestamp [default: `CURRENT_TIMESTAMP`]
  author_id int [not null]
}

Ref: "CourseCategories"."course_id" > "Courses"."course_id"
Ref: "CourseCategories"."category_id" > "Categories"."category_id"
Ref: "Enrollments"."member_id" > "Members"."member_id"
Ref: "Enrollments"."course_id" > "Courses"."course_id"
Ref: "CertificateAssignments"."member_id" > "Members"."member_id"
Ref: "CertificateAssignments"."certificate_id" > "Certificates"."certificate_id"
Ref: "BlogPosts"."author_id" > "Members"."member_id"
