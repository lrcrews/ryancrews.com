# variable to directory made by cap
app_path = '/var/www/blog/current'

# unicorn options
worker_processes 1
preload_app true
timeout 180
listen 8000

# path to app
working_directory app_path

# log to one file
stderr_path = '/var/log/unicorn/unicorn.log'
stdout_path = '/var/log/unicorn/unicorn.log'

# the process id location
pid "#{app_path}/tmp/pids/unicorn.pid"
#pid '/var/log/unicorn/unicorn.pid'

before_exec do |server|
	ENV["BUNDLE_GEMFILE"] = "#{app_path}/Gemfile"
end

after_fork do |server, worker|
	ActiveRecord::Base.establish_connection
end
