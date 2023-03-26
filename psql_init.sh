# for non interactive copying of data, otherwise it would try to ask for password everytime
export PGPASSWORD=""

# General form
# psql -U <user> -d <dbname> -c ""

psql_USERNAME="cet_go"
psql_DBNAME="cet_go_db"

# create user, database and give access rights
sudo -u postgres createuser $psql_USERNAME
sudo -u postgres createdb $psql_DBNAME
sudo -u postgres psql -c "alter user $psql_USERNAME with encrypted password $PGPASSWORD;"
sudo -u postgres psql -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO $psql_USERNAME";
# sudo -u postgres psql -c "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO Read_Only_User;"
# add data from csv
for i in cse mca ce1 eee
do
	psql -U $psql_USERNAME -d $psql_DBNAME -c "CREATE TABLE $i(id varchar primary key, X varchar, Y varchar, Z varchar, val varchar, Fx varchar, Fy varchar);"
	psql -U $psql_USERNAME -d $psql_DBNAME -c "\copy room_details(id, X, Y, Z, val, Fx, Fy) FROM '$i.csv' DELIMITER ',' CSV HEADER;"
done
