# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'mail.google.com',
  port: 587,
  user_name: 'jdisselhoff@gmail.com',
  password: 'diving_in_adrasan_2013',
  authentication: :plain,
  enable_starttls_auto: true

}

ActionMailer::Base.raise_delivery_errors = true