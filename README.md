# DEVELOPER CHALLENGE

## Challenge 1

Requirements: Through my module, I choose to use environment variables
to hide and secure my mailgun's credentials. We need a .env file with
MAILGUN_SECRET, MAILGUN_DOMAIN, MAILGUN_ADRESS.

##To setup my project

###To install dependencies:
```ruby
bundle install
```

###To run test:
```ruby
bundle exec rake
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

## Challenge 2

##Assumptions:

I use Sinatra as a web-server to create a light web application in order to parse and log open and click events when an email is opened.
Also, to have a public endpoint to put on Mailgun I use Ngrok. (Here is a download link : https://ngrok.com/)

##Requirements:

###To set database:
```ruby
bundle exec rake db:migrate
```

###To run the web-server:
```ruby
bundle exec ruby tracking_system.rb
```

###To run Ngrok and have public endpoint(by default Sinatra uses 4567 port):
```
./ngrok http 4567
```

###To set webhooks:

![webhook-screen](https://cloud.githubusercontent.com/assets/6988468/19832106/fc1ca816-9de8-11e6-840b-79348fff10de.png)

Enjoy!


















