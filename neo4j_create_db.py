# requires neo4j module to run query directly from this script
from neo4j import GraphDatabase
from dotenv import dotenv_values


# credentials here to connect to database
config = dict(dotenv_values("../cred.env"))
# print(config)
# graph db
uri_to_server = config["NEO4J_URI"]
usr = config["NEO4J_USERNAME"]
pwd = config["NEO4J_PASSWORD"]
# usr = ""
# uri_to_server = ""
# pwd = ""

graphDB_Driver  = GraphDatabase.driver(uri_to_server, auth=(usr, pwd))

# writing to a file for later use 
for i in ['cse', 'ce1', 'mca']:
	r = ""
	with open('{}.cypher'.format(i), 'r') as f:
		r = f.read()
	# print(r)
	# connecting with the neo4j driver
	with graphDB_Driver.session() as graphDB_Session:
		graph_nodes = graphDB_Session.run(r)
		# checking if the nodes where returned correctly
		res = graphDB_Session.run("MATCH(n) return n")
		print(res)


graphDB_Driver.close()