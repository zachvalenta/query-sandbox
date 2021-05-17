import sqlite3

from pypika import Query, Table, Field

# connection
conn = sqlite3.connect('./data/executions.db')
c = conn.cursor()

# query
q = Query.from_('executions').select('height')
print(q)

# run query and exit
c.execute(q.get_sql())  # sqlite3 only deals w/ strings as queries
print(c.fetchall())
c.close()
