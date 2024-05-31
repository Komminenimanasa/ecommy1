import smtplib
from smtplib import SMTP
from email.message import EmailMessage
def cmail(to,subject,body):
    server=smtplib.SMTP_SSL('smtp.gmail.com',465)
    server.login('km6130765@gmail.com','ujit xspp jgbv jzyv')
    msg=EmailMessage()
    msg['FROM']="km6130765@gmail.com"
    msg['SUBJECT']=subject
    msg['TO']=to
    msg.set_content(body)
    server.send_message(msg)
    server.quit()