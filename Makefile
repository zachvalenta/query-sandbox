help:
	@echo
	@echo "======================================================================"
	@echo
	@echo "🛠  UTILS"
	@echo
	@echo "gen:        generate SQLite db from csv (make gen f=<file>)"
	@echo "cli:        open db file using litecli (make cli f=<file>)"
	@echo "vd:         open db file using visidata (make vd f=<file>)"
	@echo "env:        show Poetry env"
	@echo "deps:       list dependencies"
	@echo
	@echo "======================================================================"
	@echo

gen:
	poetry run vd $(f) -b -o $(dir $(f))$(notdir $(basename $(f))).db

cli:
	poetry run litecli $(f)

vd:
	poetry run vd $(f)

env:
	poetry env info

deps:
	poetry show --tree