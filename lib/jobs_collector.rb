require_relative './we_work_remotely'
require_relative './remote_ok'
require_relative './stack_overflow'

class JobsCollector
  CATEGORIES = ['ruby', 'rails', 'ruby on rails', 'javascript', 'JavaScript', 'nodejs', 'node.js', 'react', 'redux']
  CAPITALIZED_CATEGORIES = ['Ruby', 'Rails', 'Ruby on Rails', 'Javascript', 'Js', 'Nodejs', 'Node.js', 'React', 'Redux']
  UPERCASED_CATEGORIES = ['RUBY', 'RAILS', 'RUBY ON RAILS', 'JAVASCRIPT', 'JS', 'NODEJS', 'NODE.JS', 'REACT', 'REDUX']

  def get_jobs
    we_work_remotely = WeWorkRemotely.new.get_jobs
    remote_ok = RemoteOk.new.get_jobs
    stack_overflow = StackOverflow.new.get_jobs

    jobs = [we_work_remotely, remote_ok, stack_overflow].flatten
    merged_categories = CATEGORIES + CAPITALIZED_CATEGORIES + UPERCASED_CATEGORIES

    jobs.select do |job|
      merged_categories.find { |category| "#{job[:title]}#{job[:description]}".include?(category) }
    end
  end
end
