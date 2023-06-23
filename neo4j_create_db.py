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

departments = ['cse', 'ce1', 'mca', 'eee', 'me', 'me_nb', 'ec1', 'ec2']
graphDB_Driver  = GraphDatabase.driver(uri_to_server, auth=(usr, pwd))

# writing to a file for later use 

with graphDB_Driver.session() as graphDB_Session:
	print(" Removing already existing departments:")
	res = graphDB_Session.run("MATCH(n) DETACH DELETE n")
	print(" \t Nodes removed: ", res.consume().counters.nodes_deleted)
	print(" \t Edges removed: ", res.consume().counters.relationships_deleted)
	print(" Creating Departments in Neo4J: ")
	for i in departments:
		r = ""
		with open('{}.cypher'.format(i), 'r') as f:
			r = f.read()
			print(' \t Creating {} graph'.format(i.upper()))
			# connecting with the neo4j driver		
			graph_nodes = graphDB_Session.run(r)
			print(" \t\t Nodes created: ", graph_nodes.consume().counters.nodes_created)
			print(" \t\t Edges created: ", graph_nodes.consume().counters.relationships_created)
			# checking if the nodes where returned correctly
	res = graphDB_Session.run("MATCH(n) return n")
	# print(res)
	# records, summary, keys = graphDB_Driver.execute_query(
	# 	"MATCH (n) RETURN n",
	# 	database_="neo4j",
	# )
	# print("The query `{query}` returned {records_count} records in {time} ms.".format(
	# 	query=summary.query, records_count=len(records),
	# 	time=summary.result_available_after
	# ))
	# print(" Nodes created: ", res.consume().counters.nodes_returned)
	# print(" Edges created: ", res.consume().counters.relationships_returned)

graphDB_Driver.close()
print(" Done !")
