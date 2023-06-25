import psycopg2 as psql
from dotenv import dotenv_values
import getpass

depts = ['cse', 'mca', 'ce1', 'ec1', 'ec2', 'me1', 'me2', 'eee']

# get credentials
config = dict(dotenv_values("../cred.env"))
# psql 
psql_usr = config["PSQL_USER"]
psql_pass = config["PSQL_PASSWORD"]
psql_db = config["PSQL_DATABASE"]
psql_port = config["PSQL_PORT"]
psql_host = config["PSQL_HOST"]

# conn = None
# conn = psql.connect(dbname=psql_db, user=psql_usr, password=psql_pass, host=psql_host, port=psql_port)

def readFile(dept):
	f = open("{}.csv".format(dept), "r")
	lines = []
	for i in f.readlines():
		e = i.replace('"', '').replace('\t', '').replace('\n', '').split(',')
		# print(e)
		try:
			lines.append([j.strip() if len(j) > 1 else j for j in e])
			# lines.append([e[0].strip(), e[1].strip(), e[2].strip(), e[3].strip(), "Room" if(len(e[4].strip()) == 0) else e[4].strip(), e[5].strip(), e[6].strip()])
		except Exception as ex:
			print(ex)
			print(e)
			pass 
	# print(lines)
	return(lines[1:])

if __name__ == '__main__':
	# global conn
	
	# creating the databases and users 
	# user = "postgres"
	# pwd = getpass.getpass(prompt="Enter password for user postgres: s")
	# conn = psql.connect(dbname=user, user=user, password=pwd, host=psql_host, port=psql_port)
	conn = psql.connect(dbname=psql_db, user=psql_usr, password=psql_pass, host=psql_host, port=psql_port)
	cursor = conn.cursor()

	# print(" Creating User {}".format(psql_usr))
	# cursor.execute("CREATE USER {} WITH LOGIN PASSWORD {}".format(psql_usr, psql_pass))
	# print(conn.notices[-1])
	# 
	# print(" Creating Database {}".format(psql_db))
	# cursor.execute("CREATE DATABASE {}".format(psql_db))
	# print(conn.notices[-1])
	
	print(" Creating dept table ")
	cursor.execute("CREATE TABLE depts(id varchar primary key, X varchar, Y varchar, name varchar);")
	# print(conn.notices[-1])
	lines = readFile('depts')
	count = 0
	for i in lines:
		count += 1
		cursor.execute("INSERT INTO depts VALUES('{}', {}, {}, '{}')".format(i[0], i[1], i[2], i[3]))
	print(" Inserted {} tuples into depts".format(count))

	print(" Creating Organizer table")
	cursor.execute("CREATE TABLE organizers(id varchar(10) primary key, username varchar(20), displayname varchar, password varchar, profile_image bytea, image_extension varchar(10), about varchar(100));")
	# print(conn.notices[-1])
	cursor.execute("INSERT INTO organizers VALUES('1', 'admin_user', 'ADMIN', 'admin_password123', NULL, NULL, 'Admin user for admin purposes');")
	# print(conn.notices[-1])
	cursor.execute("INSERT INTO organizers VALUES('2', 'non_admin_user', 'TEST USER', 'test_password123', NULL, NULL, 'test user for testing purposes');")
	# print(conn.notices[-1])

	print(" Creating Events Table")
	cursor.execute("CREATE TABLE events(event_id varchar(20) primary key, id varchar(10) not null, datetime timestamptz, title varchar(50), description varchar, location varchar(20), image bytea, image_extension varchar(10), CONSTRAINT fk_organizers_events FOREIGN KEY(id) REFERENCES organizers(id));")
	# print(conn.notices[-1])
	cursor.execute("INSERT INTO EVENTS VALUES('1', '1', '01-01-2001 00:00:00', 'Test event', 'test event', 'CS_119', NULL, NULL);")
	# print(conn.notices[-1])

	print(" Creating Departments")
	for dept in depts:
		count = 0
		print("\t Creating {}".format(dept))
		cursor.execute("CREATE TABLE {}(id varchar primary key, X varchar, Y varchar, Z varchar, val varchar, Fx varchar, Fy varchar);".format(dept))
		# print("\t\t" + conn.notices[-1])
		for i in readFile(dept):
			try:
				cursor.execute("INSERT INTO {} VALUES('{}', {}, {}, {}, '{}', {}, {})".format(dept, i[0], i[1], i[2], i[3], i[4], i[5], i[6]))
			except Exception as e:
				print(e)
				print(i)
			# if("INSERT" in conn.notices[-1]):
			count += 1
		print("\t\t Inserted {} rows".format(count))
	conn.commit()
