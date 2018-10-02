require 'typhoeus'
require 'pry'
require 'json'
require 'rss'
require 'mail'
require 'dotenv'

Dotenv.load

require_relative 'lib/jobs_collector'
require_relative 'config/mail'

task :send_jobs do
  html = ''
  jobs = JobsCollector.new.get_jobs

  jobs.each_with_index do |item, index|
    html << "<h3>#{item[:source]}</h3>" if index == 0 || jobs[index - 1][:source] != item[:source]

    html << "
      <p><b>#{item[:title]}</b><br />
      #{item[:url]}</p>
      <br/>
    "
  end

  mail = Mail.new do
    from  ENV['MAIL_USERNAME']
    to  ['jobseekers@microverse.org']
    subject "New remote jobs (#{DateTime.now.strftime("%d-%m-%Y")})"
    html_part do
      body  html
    end
  end

  mail.deliver!
end
