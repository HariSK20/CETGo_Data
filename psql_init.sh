# for non interactive copying of data, otherwise it would try to ask for password everytime
expot PGPASSWORD=""

# General form
# psql -U <user> -d <dbname> -c ""

psql_USERNAME=""
psql_DBNAME=""

# create room_details table
psql -U $psql_USERNAME -d $psql_DBNAME -c "CREATE TABLE room_details(id varchar, X varchar, Y varchar, Z varchar, val varchar, Fx varchar, Fy varchar);"

# add data from csv
for i in cse mca ce1
do
	psql -U $psql_USERNAME -d $psql_DBNAME -c "\copy room_details(id, X, Y, Z, val, Fx, Fy) FROM '$i.csv' DELIMITER ',' CSV HEADER;"
done
