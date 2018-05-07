require 'typhoeus'
require 'pry'
require 'json'
require 'rss'

require_relative 'lib/we_work_remotely'
require_relative 'lib/remote_ok'

task :post_jobs do
  slack_webhook = "fake_url"

  we_work_remotely = WeWorkRemotely.new.get_jobs
  remote_ok = RemoteOk.new.get_jobs

  text = ""

  [we_work_remotely, remote_ok].flatten.each do |item|
    text << "*Source:* #{item[:source]}\n*Title:* #{item[:title]}\n*Publication Date:* #{item[:publication_date]}\n*Link:* <#{item[:url]}>\n\n"
  end

  request = Typhoeus::Request.new(slack_webhook, method: :post, body: { text: text }.to_json)
  request.run
end

task :we_work_remotely do
  puts WeWorkRemotely.new.get_jobs
end

task :remote_ok do
  puts RemoteOk.new.get_jobs
end
