environment 'production'

daemonize false

directory '/home/ziggi/rap2/app'
rackup 'config.ru'
pidfile '/home/ziggi/rap2/app/run/puma.pid'
state_path '/home/ziggi/rap2/app/run/puma.state'
stdout_redirect '/home/ziggi/rap2/app/log/puma.stdout',
	'/home/ziggi/rap2/app/log/puma.stderr', false
threads 1, 16
bind 'tcp://127.0.0.1:8089'
workers 3


