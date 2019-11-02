_clean:
	npm run clean

build-app: _clean
	npm install
	npm run build

start-app: build-app
	npm run start

dev-build-image: _clean
	docker build -f Dockerfile.dev -t brunokarpo/frontend .

dev-run-image:
	docker-compose up --build -d

dev-run-test-image:
	docker exec -it frontend_web_1 npm run test

prod-run-image:
	docker build -t brunokarpo/frontend-prod .
	docker run --rm -p 8080:80 brunokarpo/frontend-prod