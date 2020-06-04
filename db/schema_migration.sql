-- Write your sql commands to create your db schema here.
-- It should create a table in a new table in the db/ directory.

-- schema_migration.sql
--   creates pokemon table (FAILED - 1)
--   has an autoincrementing id column (FAILED - 2)
--   has a name column (FAILED - 3)
--   has a type column (FAILED - 4)

CREATE TABLE pokemon (
    id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT
);