all: build-local local

build-local: build-local-step build-local-laravel build-local-node build-local-nginx

build-local-step: build-local-ca build-local-renewer

build-local-laravel: build-local-php build-local-nphp

build-local-node: build-local-vue build-local-ws

build-local-ca:
	docker build -t proxymurder/ca:local --target ca ./step
build-local-renewer:
	docker build -t proxymurder/renewer:local --target renewer ./step
build-local-php:
	docker build -t proxymurder/php:local --target php ./php
build-local-nphp:
	docker build -t proxymurder/nphp:local --target nphp ./php
build-local-vue:
	docker build -t proxymurder/vue:local --target vue ./node
build-local-ws:
	docker build -t proxymurder/ws:local --target ws ./node
build-local-nginx:
	docker build -t proxymurder/nginx:local ./nginx 

local:
	docker compose up -d local
www:
	docker compose up -d www
rollback:
	docker compose down