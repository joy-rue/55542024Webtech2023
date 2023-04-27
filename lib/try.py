from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import json
import smtplib
from flask import jsonify, request
import functions_framework
import firebase_admin
from firebase_admin import firestore
from firebase_admin import auth
 

# firebase_admin.initialize_app()

# # db makes ref to database
# db = firestore.client()
# profile_ref = db.collection('profiles')
# post_ref = db.collection('posts')

def send_emails(emails, name, text):   
      
    # Setting up SMTP server details
    smtp_server = "smtp.gmail.com"
    smtp_port = 587
    smtp_username = "ashesi.socialspace10@gmail.com"
    smtp_password = "jdvkkfawhxsgsbhj"
    
    # Set up the message parameters
    sender = "ashesi.socialspace10@gmail.com"
    recipients = emails
    subject = name + " made a new post on Ashesi Social Space"
    body = text
    
    #  message object
    message = MIMEMultipart()
    message['From'] = sender
    message['To'] = ", ".join(recipients)
    message['Subject'] = subject
    
    # attaching the body to the email
    message.attach(MIMEText(body, 'plain'))
    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()
        server.login(smtp_username, smtp_password)
        for email in emails:
            try:
                server.sendmail(sender, email, message.as_string())
                print("Email sent to", email)
            except:
                print("Failed to send email to", email)
    
        
    
    # templateParams = {uemail: 'ruejoysithole@gmail.com' }
    # emailjs.send("service_hobe8z3", "template_pmoxd9l", templateParams, "3M1tdZ4GBXvvWjBBl")

    return False

emails = ["boakyeokyere96@gmail.com","ruejoysithole@gmail.com","ruvimbo.sithole@ashesi.edu.gh"]
# for user_doc in profile_ref:
#             emails.append(user_doc.id) 
#             print(emails)  

send_emails(emails,"Joy"," ALERT, THIS ONE IS WORKING WOOOH!!")
