""" 
    Title: pytech_queries.py
    Author: Tanner Maine
    Date: 20 June 2022
    Description: Querying By Student ID.
"""
from pymongo import MongoClient

url = "mongodb+srv://admin:admin@cluster0.gricelu.mongodb.net/?retryWrites=true&w=majority"

client = MongoClient(url)

db = client.pytech
 
tanner = {
    "student_id": "1007",
    "first_name": "Tanner",
    "last_name": "Maine",
    "enrollments": [
        {
            "term": "Summer",
            "gpa": "3.9",
            "start_date": "June 20, 2022",
            "end_date": "August 30, 2022",
            "courses": [
                {
                    "course_id": "CYBR410",
                    "description": "Data/Database Security",
                    "instructor": "Henry Le",
                    "grade": "B"
                },
                {
                    "course_id": "CYBR420",
                    "description": "Cyber Investigations & Forensics",
                    "instructor": "James Franco",
                    "grade": "A+"
                }
            ]
        }
    ]

}

nate = {
    "student_id": "1008",
    "first_name": "Nate",
    "last_name": "Glassburner",
    "enrollments": [
        {
            "term": "Summer",
            "gpa": "2.7",
            "start_date": "June 20, 2022",
            "end_date": "August 30, 2022",
            "courses": [
                {
                    "course_id": "CYBR410",
                    "description": "Data/Database Security",
                    "instructor": "Henry Le",
                    "grade": "C"
                },
                {
                    "course_id": "CYBR420",
                    "description": "Cyber Investigations & Forensics",
                    "instructor": "James Franco",
                    "grade": "D"
                }
            ]
        }
    ]
}

jeff = {
    "student_id": "1009",
    "first_name": "Jeff",
    "last_name": "Buettner",
    "enrollments": [
        {
            "term": "Summer",
            "gpa": "3.6",
            "start_date": "June 20, 2022",
            "end_date": "August 30, 2022",
            "courses": [
                {
                    "course_id": "CYBR410",
                    "description": "Data/Database Security",
                    "instructor": "Henry Le",
                    "grade": "A+"
                },
                {
                    "course_id": "CYBR420",
                    "description": "Cyber Investigations & Forensics",
                    "instructor": "James Franco",
                    "grade": "A+"
                }
            ]
        }
    ]
}

students = db.students

print("\n  -- INSERT STATEMENTS --")
tanner_student_id = students.insert_one(tanner).inserted_id
print("  Inserted student record Tanner Maine into the students collection with document_id " + str(tanner_student_id))

nate_student_id = students.insert_one(nate).inserted_id
print("  Inserted student record Nate Glassburner into the students collection with document_id " + str(nate_student_id))

jeff_student_id = students.insert_one(jeff).inserted_id
print("  Inserted student record Jeff Buettner into the students collection with document_id " + str(jeff_student_id))

input("\n\n  End of program, press any key to exit... ")
