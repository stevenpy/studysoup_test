require 'mailgun'
require 'pry'
require 'dotenv'

class MailgunMailer
  attr_reader :unsubscribed_members

  def initialize
    @mg_client = Mailgun::Client.new ENV['MAILGUN_SECRET']
    @unsubscribed_members = nil
  end

  def send_email(recipient, subject, text, campaign_id)
    mb_obj = Mailgun::MessageBuilder.new()
    mb_obj.from(ENV['MAILGUN_ADRESS']) 
    mb_obj.add_recipient(:to, recipient)
    mb_obj.subject(subject)
    mb_obj.body_html(text)
    mb_obj.add_campaign_id(campaign_id)
    mb_obj.track_opens(true)
    @mg_client.send_message(ENV['MAILGUN_DOMAIN'], mb_obj)
  end

  def get_unsubscribed_members_by_mailing_list(mailinglist)
    result = @mg_client.get("/lists/#{mailinglist}@#{ENV['MAILGUN_DOMAIN']}/members")
    @unsubscribed_members = result.to_h.values.first.select { |member| member['subscribed'] == false}
  end

  def get_previous_mail_by_recipient(mail, limit)
    mg_events = Mailgun::Events.new(@mg_client, ENV['MAILGUN_DOMAIN'])
    result = mg_events.get({recipient: mail, limit: limit})
  end

  def print_unsubscribed_members
    return if @unsubscribed_members.nil?
    @unsubscribed_members.each do |member|
      puts member['address']
    end
  end
end