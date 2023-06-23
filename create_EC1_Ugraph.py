# requires neo4j module to run query directly from this script
# from neo4j import GraphDatabase
import math

# credentials here to connect to database
dept = "ec1"

# to find distance between nodes
def eucledian_dist(x, y):
	return(str(math.sqrt((y[0] - x[0])**2 + (y[1] - x[1])**2 + (y[2] - x[2])**2)))

def connect(str, nodes, start, end):
	# print(nodes[start])
	# print(nodes[end])
	str = str + ' ({0})-[:neigh '.format(nodes[start][0]) +"{dist: " + eucledian_dist((nodes[start][1:4]), (nodes[end][1:4])) + "}]->(" + nodes[end][0] + '),\n'
	return(str)

def create_straight_line(l):
	create_nodes_and_edges2 = ""
	# print(l)
	for i in range(len(l)-1):
		create_nodes_and_edges2 = connect(create_nodes_and_edges2, l, i, (i+1)%len(l))
		# connect(create_nodes_and_edges2, l, (i+1)%len(l), i)
	return(create_nodes_and_edges2)

# to create a circular floor path, useful in some cases
def create_circular_relationship(l):
	create_nodes_and_edges2 = ""
	# print(l)
	for i in range(len(l)):
		create_nodes_and_edges2 = connect(create_nodes_and_edges2, l, i, (i+1)%len(l))
		# connect(create_nodes_and_edges2, l, (i+1)%len(l), i)
	return(create_nodes_and_edges2)

# graphDB_Driver  = GraphDatabase.driver(uri_to_server, auth=(usr, pwd))


# read nodes from csv file
f = open("{}.csv".format(dept), "r")
nodes = []
for i in f.readlines():
	e = i.replace('"', '').replace('\t', '').replace('\n', '').split(',')
	# print(e)
	try:
		nodes.append([e[0].strip(), float(e[1].strip()), float(e[2].strip()), int(e[3].strip()), "filter" if(len(e[4].strip()) == 0) else e[4].strip()])
	except Exception as ex:
		print(ex)
		print(e)
		nodes = []
		pass 

# print(nodes)
if(nodes == []):
	raise SystemExit(0)
nodes.insert(0, ["padding"])
nodes.insert(0, ["padding"])

# print(nodes)
f.close()
print(len(nodes))

# Starting the create query
create_nodes_and_edges = "CREATE"

# for i in nodes[:2]:
# 	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":purifier { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"

for (j, i) in enumerate(nodes[2:], 2):
	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + (
		":stairs" if(j in [31, 32, 62, 63]
		) else ( ":junction" if j in [5, 7, 9, 12, 16, 20, 23, 37, 40, 42, 45, 48, 51] else ":room" )
		)  + " { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"

# for i in nodes[-6:]:
# 	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":stairs { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"
# create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, , )

# create relationships for floor 0
create_nodes_and_edges1 = create_straight_line((nodes[2:27]))
create_nodes_and_edges1 = connect(create_nodes_and_edges1, nodes, 27, 7)
create_nodes_and_edges1 = create_nodes_and_edges1 + create_straight_line((nodes[28:31]))
create_nodes_and_edges1 = connect(create_nodes_and_edges1, nodes, 28, 9)
create_nodes_and_edges1 = connect(create_nodes_and_edges1, nodes, 31, 5)
create_nodes_and_edges1 = connect(create_nodes_and_edges1, nodes, 32, 16)
# create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, , )

# create relationships for floor 1
create_nodes_and_edges2 = create_straight_line(nodes[33: 54])
create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, 55, 48)
create_nodes_and_edges2 = create_nodes_and_edges2 + create_straight_line((nodes[57:60]))
create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, 57, 40)
create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, 60, 45)
create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, 51, 61)
create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, 56, 38)
create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, 62, 37)
create_nodes_and_edges2 = connect(create_nodes_and_edges2, nodes, 63, 45)

# print(create_nodes_and_edges2)


create_nodes_and_edges = create_nodes_and_edges + create_nodes_and_edges1 + create_nodes_and_edges2 


# create relationships for stairs
create_nodes_and_edges5 = connect("", nodes, 31,62)
create_nodes_and_edges5 = connect(create_nodes_and_edges5, nodes, 32, 63)

# # Adding water purifiers

# a, b = (0, 9)
# create_nodes_and_edges5 = create_nodes_and_edges5 + ' ({0})-[:neigh '.format(nodes[a][0]) +"{dist: " + eucledian_dist((nodes[a][1:3]), (nodes[b][1:3])) + "}]->(" + nodes[b][0] + '),\n'
# # create_nodes_and_edges5 = create_nodes_and_edges5 + ' ({0})-[:neigh '.format(nodes[b][0]) +"{dist: " + eucledian_dist((nodes[a][1:3]), (nodes[b][1:3])) + "}]->(" + nodes[a][0] + '),'


# a, b = (1, 49)
# create_nodes_and_edges5 = create_nodes_and_edges5 + ' ({0})-[:neigh '.format(nodes[a][0]) +"{dist: " + eucledian_dist((nodes[a][1:3]), (nodes[b][1:3])) + "}]->(" + nodes[b][0] + '),\n'
# # create_nodes_and_edges5 = create_nodes_and_edges5 + ' ({0})-[:neigh '.format(nodes[b][0]) +"{dist: " + eucledian_dist((nodes[a][1:3]), (nodes[b][1:3])) + "}]->(" + nodes[a][0] + '),'


# combining all queries
create_nodes_and_edges = create_nodes_and_edges + create_nodes_and_edges5
create_nodes_and_edges = create_nodes_and_edges[:-2] + ';' 
print(create_nodes_and_edges)

# writing to a file for later use 
with open('{}.cypher'.format(dept), 'w') as f:
	f.write(create_nodes_and_edges)

# # connecting with the neo4j driver
# with graphDB_Driver.session() as graphDB_Session:
# 	graph_nodes = graphDB_Session.run(create_nodes_and_edges[:-1])
# 	# checking if the nodes where returned correctly
# 	res = graphDB_Session.run("MATCH(n) return n")
# 	print(res)
# graphDB_Driver.close()
