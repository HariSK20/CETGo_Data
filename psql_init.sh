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

# create department table
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

# create user table for organizers
psql -U psql -U $psql_USERNAME -d $psql_DBNAME -c "CREATE TABLE organizers(id varchar(10) primary key, username varchar(20), displayname varchar(30), password varchar(100), profile_image bytea, image_extension varchar(10), about varchar(100));"
psql -U $psql_USERNAME -d $psql_DBNAME -c "INSERT INTO organizers VALUES('1', 'admin_user', 'ADMIN', 'admin_password123', NULL, NULL, 'Admin user for admin purposes');"
psql -U $psql_USERNAME -d $psql_DBNAME -c "INSERT INTO organizers VALUES('2', 'non_admin_user', 'TEST USER', 'test_password123', NULL, NULL, 'test user for testing purposes');"


# Create events table 
psql -U $psql_USERNAME -d $psql_DBNAME -c "CREATE TABLE events(event_id varchar(20) primary key, id varchar(10) not null, datetime timestamptz, title varchar(50), description varchar(100), location varchar(20), image bytea, image_extension varchar(10), CONSTRAINT fk_organizers_events FOREIGN KEY(id) REFERENCES organizers(id));"
psql -U $psql_USERNAME -d $psql_DBNAME -c "INSERT INTO EVENTS VALUES('1', '1', '01-01-2001 00:00:00', 'Test event', 'test event', 'CS_119', NULL, NULL);"



