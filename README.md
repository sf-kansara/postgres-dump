## Create DB sql or Table csv file dumps for postgres db

## Export
### DB sql
`public` schema for user, customer & sales DBs
```bash
./db_sql_export.sh -h localhost -p 5432 -U postgres --db-names users-db,customers-db,sales-db --schema public
```

### Table csv
Tables user, role in `public` schema for user DB
```bash
./table_csv_export.sh -h localhost -p 5432 -U postgres -d users-db --schema public --table-names user_mst,role_mst
```

## Import
### DB sql
`public` schema for user, customer & sales DBs
```bash
./db_sql_import.sh -h localhost -p 5432 -U postgres --dump-folder db-sql-dump-20210303-17:59:33
```

### Table csv
Tables user, role in `public` schema for user DB
```bash
./table_csv_import.sh -h localhost -p 5432 -U postgres -d users-db --schema public --dump-folder table-csv-dump-20210303-17:59:36
```