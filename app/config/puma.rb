environment 'production'

daemonize false

directory '/home/ziggi/rapp4b/app'
rackup 'config.ru'
pidfile '/home/ziggi/rapp4b/app/run/puma.pid'
state_path '/home/ziggi/rapp4b/app/run/puma.state'
stdout_redirect '/home/ziggi/rapp4b/app/log/puma.stdout',
	'/home/ziggi/rapp4b/app/log/puma.stderr', true
threads 1, 16
bind 'tcp://127.0.0.1:8089'
workers 3


