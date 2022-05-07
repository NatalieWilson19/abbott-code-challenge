import  imaplib
import email

# IMAP Settings
# https://support.microsoft.com/en-us/office/pop-imap-and-smtp-settings-8361e398-8af4-4e97-b147-6c6c4ac95353

user = "codechallengeadc@outlook.com"
password = "P@ssword$1234"

# This functions connects to the outlook server, logins, and returns the most recent email body as a string
def get_most_recent_email(user, password):

    imapHOST = "outlook.office365.com"

    #This initalizes a connection to the email server
    #SSL encyrpts it
    connection = imaplib.IMAP4_SSL(imapHOST)

    # Login
    connection.login(user, password)
    # We are looking at our inbox
    connection.select("INBOX")

    # result contains whether or not it fetched or not
    # data has a bunch of bytes representing each search result
    #result, data = connection.search(None, '(FROM "do-not-reply@libreview.io")')
    result, data = connection.search(None, 'ALL') 
    # Seperate each byte and grab the last one which is the most recent
    temp_list = data[0].split()
    most_recent = temp_list[-1]


    # Now fetch the most recent message
    result, data = connection.fetch(most_recent, '(RFC822)')

    # https://docs.python.org/3/library/email.parser.html
    # Return a message object structure from a bytes-like object. 
    email_msg_obj = email.message_from_bytes(data[0][1])

    # Payload means content
    # https://docs.python.org/3.5/library/email.message.html
    # With optional argument i, get_payload() will return the i-th element of the payload, counting from zero
    # For us, 0 gives the correct output of the email body
    email_body = email_msg_obj.get_payload(0)

    # Return as a string
    connection.close()
    return email_body.as_string()




email_body = get_most_recent_email(user, password)
