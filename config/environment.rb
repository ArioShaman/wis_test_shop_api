# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => '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',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :palin,
    :enable_starttls_auto => true
}
