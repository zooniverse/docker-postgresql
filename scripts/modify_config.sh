#add extrac config files for
{ echo; echo "include_if_exists = '/etc/postgres/postgresql.conf'"; } >> "$PGDATA/postgresql.conf"
mv ./postgresql.conf /etc/postgres/postgresql.conf
