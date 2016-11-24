.DEFAULT_GOAL := test

LOCAL_IN = requirements/local.in
LOCAL_TXT = requirements/local.txt


install-dev-requirements:
	## Install requirements for local development environment
	pip install -q pip-tools
	pip-sync requirements/*.txt


pip-compile:
	## Update requirements/*.txt with latest packages from requirements/*.in
	pip install -q pip-tools
	pip-compile -U requirements/app.in
ifneq (, $(wildcard $(LOCAL_IN)))
	pip-compile -U $(LOCAL_IN)
endif


prod-compose:
	@env $$(cat .env.docker.prod | xargs) docker-compose \
		-f docker-compose.yml \
		-f docker-compose.override.prod.yml \
		$(CMD)
