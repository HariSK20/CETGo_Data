# for non interactive copying of data, otherwise it would try to ask for password everytime
# export PGPASSWORD=""
PGPASSWORD="cet_go_Password123"
# General form
# psql -U <user> -d <dbname> -c ""

psql_USERNAME="cet_go"
psql_DBNAME="cet_go_db"

# create user, database and give access rights
# sudo -u postgres createuser $psql_USERNAME
# sudo -u postgres psql -c "alter user $psql_USERNAME with encrypted password $PGPASSWORD;"
sudo -u postgres psql -c "create user $psql_USERNAME with login password '$PGPASSWORD';"
sudo -u postgres createdb $psql_DBNAME
sudo -u postgres psql -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO $psql_USERNAME";
# sudo -u postgres psql -c "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO Read_Only_User;"
# add data from csv
psql -U $psql_USERNAME -d $psql_DBNAME -c "CREATE TABLE depts(id varchar primary key, X varchar, Y varchar, name varchar);"
psql -U $psql_USERNAME -d $psql_DBNAME -c "\copy depts(id, X, Y, name) FROM 'depts.csv' DELIMITER ',' CSV HEADER;"


for i in cse mca ce1 eee
do
	psql -U $psql_USERNAME -d $psql_DBNAME -c "CREATE TABLE $i(id varchar primary key, X varchar, Y varchar, Z varchar, val varchar, Fx varchar, Fy varchar);"
	psql -U $psql_USERNAME -d $psql_DBNAME -c "\copy $i(id, X, Y, Z, val, Fx, Fy) FROM '$i.csv' DELIMITER ',' CSV HEADER;"
done

for i in ec1 ec2 me
do
	psql -U $psql_USERNAME -d $psql_DBNAME -c "CREATE TABLE $i(id varchar primary key, X varchar, Y varchar, Z varchar, val varchar);"
	psql -U $psql_USERNAME -d $psql_DBNAME -c "\copy $i(id, X, Y, Z, val) FROM '$i.csv' DELIMITER ',' CSV HEADER;"
done

