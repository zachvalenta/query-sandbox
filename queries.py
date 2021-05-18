import sqlite3

from pypika import Field, Query, Table, functions as fn

###
# CONNECTION
###

conn = sqlite3.connect("./data/executions.db")
c = conn.cursor()

###
# TABLES
###

ex = Table("executions")

###
# QUERIES
###

# basic
basic = Query.from_("executions").select("height")

# percentage of prisoners w/ no value for height
no_height = Query.from_(ex).select(fn.Count("height")).where(ex.height == "")
all_ex = Query.from_(ex).select(fn.Count("height"))
q = f"select ({no_height.get_sql()}) * 100 / ({all_ex.get_sql()})"

###
# RUN QUERY AND EXIT
###

c.execute(q)  # sqlite3 only deals w/ strings as queries
print(c.fetchall())
c.close()
