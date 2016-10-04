# DEVELOPER CHALLENGE

Through my module, I choose to use environment variables
to hide and secure my mailgun's credentials. We need a .env file with
MAILGUN_SECRET, MAILGUN_DOMAIN, MAILGUN_ADRESS.

##To setup my project

###To install dependencies:
```ruby
bundle install
```

###To run test:
```ruby
rake
```

This method sends an email with a subject, text,
campaign id to any email address:
```ruby
def send_email(recipient, subject, text, campaign_id)
end
```

This method gets the list of unsubscribed members
in a specific list:
```ruby
def get_unsubscribed_members_by_mailing_list(memberlist)
end
```

This method gets the list of previously sent emails
to an email address with a limit:
```ruby
def get_previous_mail_by_recipient(mail, limit)
end
```

# TESTSUITE

Test if an email sent is delivered by checking the
success code (200):
``` ruby
def test_send_mail_if_email_delivered
end
```

Test when trying to send email without specifying
a recipient. A communicationerror is raised:
```ruby
def test_send_mail_if_no_params
end
```

Get the last previous email received and check if they are delivered to
the right recipient:
``` ruby
def test_get_previous_mail_by_recipient_are_delivered
end
```

Test that the unsubscribed list is not empty and for each member,
we validate the email address format:
``` ruby
def test_print_unsubscribed_members
end
```