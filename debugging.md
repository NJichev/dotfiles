## Postgres debugging tips and tricks

Select all connections:
```
SELECT
    pid
    ,datname
    ,usename
    ,application_name
    ,client_hostname
    ,client_port
    ,backend_start
    ,query_start
    ,query
    ,state
FROM pg_stat_activity
WHERE state = 'active'
```

See if `your table name` has any locks on it:
```sql
select pid, state, usename, query, query_start
from pg_stat_activity
where pid in (
  select pid from pg_locks l
  join pg_class t on l.relation = t.oid
  and t.relkind = 'r'
  where t.relname = 'your table name'
);
```

To kill a postgres lock you can use the following:
```
SELECT pg_cancel_backend(pid);
```
