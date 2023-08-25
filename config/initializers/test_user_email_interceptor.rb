class TestUserEmailInterceptor
  def self.delivering_email(message)
    message.to = ['john_doe@hex.com']
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(TestUserEmailInterceptor)
end
