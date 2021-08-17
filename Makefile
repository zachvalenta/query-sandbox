help:
	@echo
	@echo "======================================================================"
	@echo
	@echo "CREATE DB"
	@echo
	@echo "gen:        generate SQLite db from csv (make gen f=data/<file>)"
	@echo "deals:      generate deals db"
	@echo "verbs:      generate verbs db"
	@echo
	@echo "ACCESS DB"
	@echo
	@echo "lite:       open db file using litecli (make lite f=data/<file>)"
	@echo "vd:         open db file using visidata (make vd f=data/<file>)"
	@echo "pika:       run PyPika-generated queries with sqlite3"
	@echo
	@echo "DEPS"
	@echo
	@echo "env:        show Poetry env"
	@echo "deps:       list dependencies"
	@echo
	@echo "======================================================================"
	@echo

#
# CREATE
#

gen:
	poetry run vd $(f) -b -o $(dir $(f))$(notdir $(basename $(f))).db

deals:
	rm data/deals.db 2> /dev/null; sqlite3 data/deals.db < data/deals.sql

verbs:
	rm data/verbos.db 2> /dev/null; sqlite3 data/verbos.db < data/verbos.sql

#
# ACCESS
#

lite:
	poetry run litecli --liteclirc litecli.conf $(f)

vd:
	poetry run vd $(f)

pika:
	poetry run python queries.py

#
# DEPS
#

env:
	poetry env info

deps:
	poetry show --tree
