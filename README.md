# CAPP-AIR

## python startup

```python
import polars as pl
dot_path = Path(os.path.expandvars('$HOME/Documents/denv/dotfiles/data/eda'))
foo = pl.read_csv(f'{dot_path}/foo.csv')
bar = pl.read_csv(f'{dot_path}/bar.csv')
```

## version control data

```sh
# dotfiles
├── data
│   └── ed
│   └──── bar.csv
│   └──── foo.csv
```

* `foo.csv`
```csv
id,mpn,mfg,price
1,6WFR,samsung,408
2,SLWM,samsung,488
3,PAY4,lg,260
4,5K6O,motorola,223
5,EXKJ,motorola,153
6,7JNT,apple,481
7,VY1Z,google,523
8,NYK3,samsung,256
9,DTVH,sony,433
10,7S3J,oneplus,274
```

* `bar.csv`
```csv
id,mfg,price
6WFR,samsung,372
SLWM,samsung,488
PAY4,lg,236
5K6O,motorola,223
EXKJ,motorola,134
7JNT,apple,481
VY1Z,google,475
NYK3,samsung,256
DTVH,sony,433
7S3J,oneplus,263
```

# APPROACHES

* this repo 📍 fix CSV-SQL conversion (DuckDB? SQLite?)
* Polars seed data in dotfiles and read by python startup
* Polars read from Hugging Face https://docs.pola.rs/user-guide/io/hugging-face/ https://pola.rs/posts/polars-hugging-face/
* storage limits: Github, csvbase

# PREVIOUS README

---

This is a sandbox for practicing SQL queries.

add this https://hackernews-insight.vercel.app/user-analysis

Here's the data:
```sh
├── data
│   └── china.sql       # https://github.com/cbdb-project
│   └── deals.sql       # https://learnsql.com/blog/sql-non-equi-joins-examples/
│   └── executions.csv  # https://selectstarsql.com/frontmatter.html#dataset
│   └── housing.csv     # https://www.zillow.com/research/data/
│   └── music           # https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks
│   └──── artist.csv
│   └──── genre.csv
│   └──── song.csv
│   └──── year.csv
│   └── shootings.csv   # https://catalog.data.gov/dataset/nypd-shooting-incident-data-historic
│   └── tfr.csv         # https://www.cia.gov/the-world-factbook/field/total-fertility-rate/country-comparison
│   └── verbos.sql      # https://github.com/ghidinelli/fred-jehle-spanish-verbs
```

To get started:

* install the dependencies (`poetry install`)
* then use the Makefile to generate a SQLite db file
```sh
make gen f=data/music/artist.csv
```
* then explore the data with either `litecli` or `visidata`
```sh
make vd f=data/music/artist.db
```
* see the full Makefile for more targets
```Makefile
======================================================================

CREATE DB

gen:        generate SQLite db from csv (make gen f=data/<file>)
deals:      generate deals db
verbs:      generate verbs db

ACCESS DB

lite:       open db file using litecli (make lite f=data/<file>)
vd:         open db file using visidata (make vd f=data/<file>)
pika:       run PyPika-generated queries with sqlite3

DEPS

env:        show Poetry env
deps:       list dependencies

======================================================================
```
