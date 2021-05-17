help:
	@echo
	@echo "======================================================================"
	@echo
	@echo "🛠  UTILS"
	@echo
	@echo "gen:        generate SQLite db from csv (make gen f=<file>)"
	@echo "cli:        open db file using litecli (make cli f=<file>)"
	@echo "vd:         open db file using visidata (make vd f=<file>)"
	@echo "pika:       run PyPika-generated queries with sqlite3"
	@echo "env:        show Poetry env"
	@echo "deps:       list dependencies"
	@echo
	@echo "======================================================================"
	@echo

gen:
	poetry run vd $(f) -b -o $(dir $(f))$(notdir $(basename $(f))).db

cli:
	poetry run litecli --liteclirc litecli.conf $(f)

vd:
	poetry run vd $(f)

pika:
	poetry run python queries.py

env:
	poetry env info

deps:
	poetry show --tree
