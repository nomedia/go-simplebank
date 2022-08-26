mysql:
	docker run --name  mysql-auth-service -p 33068:3306   -e MYSQL_ROOT_PASSWORD=secret -d mysql

createdb:
	docker exec -it mysql-auth-service  mysqladmin -uroot -psecret create mysql_auth_service ;

dropdb:
	docker exec -it mysql-auth-service mysqladmin drop mysql_auth_service -f -uroot -psecret
migrateup:
	migrate -path db/migration --database "mysql://root:secret@tcp(127.0.0.1:33068)/mysql_auth_service"  -verbose up
migratedown:
	migrate -path db/migration --database "mysql://root:secret@tcp(127.0.0.1:33068)/mysql_auth_service"  -verbose down
sqlc:
	sqlc generate
test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migratedown migrateup