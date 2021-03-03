## Create DB sql or Table csv file dumps for postgres db

### DB sql
`public` schema for user, customer & sales DBs
```bash
./db_sql_export.sh -h localhost -p 5432 -U postgres --db-names users-db,customers-db,sales-db --schema public
```

### Table csv
Tables user, role in`public` schema for user DB
```bash
./table_csv_export.sh -h localhost -p 5432 -U postgres -d users --table-names user_mst,role_mst --schema public
```