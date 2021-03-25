# query sandbox

This is a sandbox for practicing SQL queries.

Here's the data:
```sh
├── data
│   └── executions.csv  # https://selectstarsql.com/frontmatter.html#dataset
│   └── housing.csv     # https://www.zillow.com/research/data/
│   └── music           # https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks
│   └──── artist.csv
│   └──── genre.csv
│   └──── song.csv
│   └──── year.csv
│   └── shootings.csv   # https://catalog.data.gov/dataset/nypd-shooting-incident-data-historic
│   └── verbos.sql      # https://github.com/ghidinelli/fred-jehle-spanish-verbs
```

To get started:

* install the dependencies (`poetry install`)
* then use the Makefile to generate a SQLite db file
```sh
# will generate data/music/artist.db
make gen f=data/music/artist.csv

# for the db of Spanish verbs, you need the SQLite client
sqlite3 db/verbos.db < data/verbos.sql
```
* then explore the data with either `litecli` or `visidata`
```Makefile
======================================================================

🛠  UTILS

gen:        generate SQLite db from csv (make gen f=<file>)
cli:        open db file using litecli (make cli f=<file>)
vd:         open db file using visidata (make vd f=<file>)
env:        show Poetry env
deps:       list dependencies

======================================================================
```
