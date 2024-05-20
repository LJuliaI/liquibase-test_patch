build_db:
	docker build -t bigdata-db infra/db/.
	docker build -t bigdata-db-test infra/db/.

stop_db:
	docker container rm -f bigdata-db || true
	docker container rm -f bigdata-db-test || true

run_db:
	make stop_db
	make build_db
	docker run -d --name bigdata-db -p 5433:5432 bigdata-db
	docker run -d --name bigdata-db-test -p 5434:5432 bigdata-db-test
