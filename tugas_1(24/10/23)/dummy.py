import pandas as pd
from faker import Faker
from collections import defaultdict
from sqlalchemy import create_engine
from urllib.parse import quote_plus
import random

TOTAL_DATA = 100
COURSES = [
  "Introduction to Computer Science",
  "Python Programming",
  "Java Programming",
  "C++ Programming",
  "HTML and CSS",
  "JavaScript",
  "PHP Programming",
  "Ruby on Rails",
  "Front-end Web Development",
  "Back-end Web Development",
  "iOS App Development",
  "Android App Development",
  "Database Management",
  "SQL Fundamentals",
  "NoSQL Databases",
  "Data Warehousing",
  "Business Intelligence",
  "Data Analytics",
  "Data Visualization",
  "Big Data Analytics",
  "Machine Learning",
  "Deep Learning",
  "Natural Language Processing",
  "Computer Vision",
  "Neural Networks",
  "Cybersecurity Fundamentals",
  "Network Security",
  "Ethical Hacking",
  "Penetration Testing",
  "Cryptography",
  "Security Policies and Procedures",
  "Cloud Computing Basics",
  "Amazon Web Services (AWS)",
  "Microsoft Azure",
  "Google Cloud Platform",
  "Virtualization and Containers",
  "DevOps Practices",
  "Continuous Integration/Continuous Deployment (CI/CD)",
  "Container Orchestration (e.g., Kubernetes)",
  "IT Project Management",
  "Agile Methodologies",
  "Scrum",
  "Kanban",
  "IT Service Management (ITSM)",
  "Information Systems Analysis",
  "Systems Design and Architecture",
  "Operating Systems (e.g., Linux, Windows)",
  "IT Governance and Compliance",
  "IT Risk Management",
  "IT Audit and Assurance",
  "ITIL (Information Technology Infrastructure Library)",
  "Data Center Management",
  "Network Administration",
  "Routing and Switching",
  "Wireless Networking",
  "Network Design and Implementation",
  "Internet of Things (IoT)",
  "Embedded Systems",
  "Cloud Security",
  "Mobile Security",
  "Virtual Private Networks (VPNs)",
  "Firewall Configuration and Management",
  "Digital Forensics",
  "Network Monitoring and Analysis",
  "Disaster Recovery and Business Continuity",
  "IT Ethics and Legal Issues",
  "Software Development Life Cycle (SDLC)",
  "Object-Oriented Programming (OOP)",
  "Test-Driven Development (TDD)",
  "Software Testing and Quality Assurance",
  "User Interface (UI) Design",
  "User Experience (UX) Design",
  "Interaction Design",
  "Human-Computer Interaction (HCI)",
  "3D Modeling and Animation",
  "Game Development",
  "Augmented Reality (AR)",
  "Virtual Reality (VR)",
  "User Acceptance Testing (UAT)",
  "IT Procurement and Vendor Management",
  "Cloud Migration Strategies",
  "Data Privacy and Protection",
  "IT Leadership and Management",
  "IT Career Development",
  "IT Communication and Presentation Skills",
  "IT Financial Management",
  "IT for Small Businesses",
  "Social Media Marketing",
  "Search Engine Optimization (SEO)",
  "Content Management Systems (CMS)",
  "E-commerce Platforms",
  "Digital Analytics and Metrics",
  "Web Accessibility and Inclusive Design",
  "Internet Security and Privacy",
  "Mobile User Interface Design",
  "Enterprise Resource Planning (ERP) Systems",
  "Customer Relationship Management (CRM) Systems",
  "Project Portfolio Management (PPM)",
  "IT for Healthcare",
  "IT for Education"
] 

fake = Faker()
fake_data = defaultdict(list)

password = "pass"
db_name = "akademik"
table_student = "student"
table_course = "course"
table_lecturer = "lecturer"
table_task = "task"

engine = create_engine('mysql://root:%s@localhost/%s' % (quote_plus(password), db_name), echo=False)


def create_dummy_student():
  for _ in range(TOTAL_DATA):
    fake_data["name_student"].append(fake.name())
    fake_data["nrp"].append('5027191' + str(_ + 1).zfill(3))
  for _ in range(TOTAL_DATA):
    fake_data["name_student"].append(fake.name())
    fake_data["nrp"].append('5027201' + str(_ + 1).zfill(3))
  for _ in range(TOTAL_DATA):
    fake_data["name_student"].append(fake.name())
    fake_data["nrp"].append('5027211' + str(_ + 1).zfill(3))
  for _ in range(TOTAL_DATA):
    fake_data["name_student"].append(fake.name())
    fake_data["nrp"].append('5027221' + str(_ + 1).zfill(3))
  for _ in range(TOTAL_DATA):
    fake_data["name_student"].append(fake.name())
    fake_data["nrp"].append('5027231' + str(_ + 1).zfill(3))
  df_student = pd.DataFrame(fake_data)
  try:
    df_student.to_sql(table_student, con=engine, index=False, if_exists="append")
    print("Student data has been successfully generated!")
  except Exception as e:
    print(e)
  
    
def create_dummy_course():
  for _ in range(TOTAL_DATA):
    fake_data["name_course"].append(fake.sentence(nb_words=1, ext_word_list=COURSES))
  df_course = pd.DataFrame(fake_data)
  try:
    df_course.to_sql(table_course, con=engine, index=False, if_exists="append")
    print("Course data has been successfully generated!")
  except Exception as e:
    print(e)
    
    
def create_dummy_lecturer():
  for _ in range(TOTAL_DATA):
    fake_data["name_lecturer"].append(fake.name())
    fake_data["nip"].append(str(random.randint(1990, 2022)) + str(random.randint(18, 19)) + str(random.randint(1, 98)).zfill(2) + '1' + str(random.randint(0, 1)) + str(random.randint(1, 200)).zfill(3))
  df_lecturer = pd.DataFrame(fake_data)
  try:
    df_lecturer.to_sql(table_lecturer, con=engine, index=False, if_exists="append")
    print("Lecturer data has been successfully generated!")
  except Exception as e:
    print(e)
  
    
def create_dummy_task():
  for _ in range(TOTAL_DATA):
    fake_data["id_mk"].append(random.randint(1, 100))
    fake_data["id_mhs"].append(random.randint(1, 100))
    fake_data["id_dos"].append(random.randint(1, 100))
    fake_data["score"].append(random.randint(1, 100))
    fake_data["desc_task"].append(fake.paragraph(nb_sentences=3, variable_nb_sentences=False))
  df_task = pd.DataFrame(fake_data)
  try:
    df_task.to_sql(table_task, con=engine, index=False, if_exists="append")
    print("Task data has been successfully generated!")
  except Exception as e:
    print(e)


if __name__ == "__main__":
  print("1. Create Dummy Student")
  print("2. Create Dummy Course")
  print("3. Create Dummy Lecturer")
  print("4. Create Dummy Task")
  user_input = int(input("Pilih: "))
  
  if user_input == 1:
    create_dummy_student()
  elif user_input == 2:
    create_dummy_course()
  elif user_input == 3:
    create_dummy_lecturer()
  elif user_input == 4:
    create_dummy_task()
  