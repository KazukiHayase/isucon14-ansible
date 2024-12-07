BRANCH:=main

DB_HOST:=127.0.0.1
DB_PORT:=3306
DB_USER:=isucon
DB_PASS:=isucon
DB_NAME:=TODO
MYSQL_CMD:=mysql -h$(DB_HOST) -P$(DB_PORT) -u$(DB_USER) -p$(DB_PASS) $(DB_NAME)

APP_SERVICE_NAME:=TODO

.PHONY: checkout
checkout:
	git chekout $(BRANCH)
	git pull origin $(BRANCH)

# e.g. make start service=nginx
.PHONY: restart
restart:
	sudo systemctl restart $(service)

.PHONY: restart-all
restart-all:
	sudo systemctl restart nginx
	sudo systemctl restart mysql
	sudo systemctl restart $(APP_SERVICE_NAME)

.PHONY: sql
sql:
	sudo $(MYSQL_CMD)

.PHONY: list
list:
	echo "hoge" | grep -E 'nginx|mysql|$(APP_SERVICE_NAME)'

# e.g. make cat service=nginx
.PHONY: cat
cat:
	sudo systemctl cat $(service)

# e.g. make reload service=nginx
.PHONY: reload
reload:
	sudo systemctl daemon-reload $(service)
