class ApplicationMailer < ActionMailer::Base
  default from: "library@test.com"
  layout "mailer"
end
