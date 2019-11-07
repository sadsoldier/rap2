
AUTOMAKE_OPTIONS = foreign no-dependencies no-installinfo

APPDIR = app

all:
	cd app && ./bin/bundle install --path vendor/bundle
	mkdir -p app/run app/tmp

bin_SCRIPTS = rapp

EXTRA_DIST = app

install-data-local:
	test -z $(APP_LIBDIR) || $(MKDIR_P) $(APP_LIBDIR)
	cd ${APPDIR} && cp -r . $(APP_LIBDIR)
	test -z $(APP_LOGDIR) || $(MKDIR_P) $(APP_LOGDIR)
	test -z $(APP_RUNDIR) || $(MKDIR_P) $(APP_RUNDIR)
#EOF
