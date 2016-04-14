from smtplib import SMTP
import datetime

import time

debuglevel = 0

smtp = SMTP()
smtp.set_debuglevel(debuglevel)
smtp.connect('localhost', 26)
smtp.ehlo()

from_addr = "John Doe <john@doe.net>"
to_addr = "harry@example.net"

subj = "hello"
date = datetime.datetime.now().strftime( "%d/%m/%Y %H:%M" )

message_text = "Hello\nThis is a mail from your server\n\nBye\n"

msg = "From: %s\nTo: %s\nSubject: %s\nDate: %s\n\n%s" % ( from_addr, to_addr, subj, date, message_text )

smtp.sendmail(from_addr, to_addr, msg)
smtp.quit()

for i in range(5):
    time.sleep(60)  # Delay for 1 minute (60 seconds)
    print "Minute(s) Passed: "+str(i)

print "Greylisting Time Up."
time.sleep(10)

smtp = SMTP()
smtp.set_debuglevel(debuglevel)
smtp.connect('localhost', 26)
smtp.ehlo()

from_addr = "John Doe <john@doe.net>"
to_addr = "harry@example.net"

subj = "hello"
date = datetime.datetime.now().strftime( "%d/%m/%Y %H:%M" )

message_text = "Hello\nThis is a mail from your server\n\nBye\n"

msg = "From: %s\nTo: %s\nSubject: %s\nDate: %s\n\n%s" % ( from_addr, to_addr, subj, date, message_text )

smtp.sendmail(from_addr, to_addr, msg)
smtp.quit()
