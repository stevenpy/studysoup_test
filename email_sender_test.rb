require_relative 'email_sender'
require 'dotenv'
require 'pry'
require 'test/unit'

class TestMailgunMailer < Test::Unit::TestCase
  def setup
    Dotenv.load
    @mg_client = MailgunMailer.new
  end

  def test_send_mail_if_email_delivered
    result = @mg_client.send_email('stevenphilbert@gmail.com', 'Bienvenue', 'Hello to our newsletter', 'Newsletter')
    assert_not_nil(result.to_h['id'])
    assert_not_nil(result.to_h['message'])
    assert_equal(200, result.code)
  end

  def test_send_mail_if_no_params
    assert_raise(Mailgun::CommunicationError) do
      @mg_client.send_email('', 'Bienvenue', 'Hello to our newsletter', 'Newsletter')
    end
  end

  def test_get_previous_mail_by_recipient_are_delivered
    result = @mg_client.get_previous_mail_by_recipient('stevenphilbert@gmail.com', 1)
    assert_not_nil(result)
    assert_equal(1, result.to_h['items'].size)
    result.to_h['items'].each do | item |
      assert_equal('delivered', item['event'])
      assert_equal(item['recipient'], item['message']['headers']['to'])
    end
  end

  def test_print_unsubscribed_members
    assert_nil(@mg_client.unsubscribed_members)
    @mg_client.get_unsubscribed_members_by_mailing_list('my_list')
    assert_not_nil(@mg_client.unsubscribed_members)
    @mg_client.unsubscribed_members.each do |member|
      assert_match(/^*@*.*$/, member['address'])
    end
  end
end