Mail.defaults do
  delivery_method :smtp,
  address: "smtp.gmail.com",
  port: 587,
  authentication: 'plain',
  enable_starttls_auto: true,
  user_name: ENV['MAIL_USERNAME'],
  password: ENV['MAIL_PASSWORD']
end
