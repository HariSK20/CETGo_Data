# requires neo4j module to run query directly from this script
from neo4j import GraphDatabase
import math

# credentials here to connect to database
usr = ""
uri_to_server = ""
pwd = ""


# to find distance between nodes
def euclidean_dist(x, y):
	try:
		return(str(math.sqrt((y[0] - x[0])**2 + (y[1] - x[1])**2 + (y[2] - x[2])**2)))
	except:
		print(x)
		print(y)
		raise SystemExit(0)


def add_neighbor_path(start, end, current_paths = ""):
	return(current_paths + ' ({0})-[:neigh '.format(nodes[start][0]) +"{dist: " + euclidean_dist((nodes[start][1:4]), (nodes[end][1:4])) + "}]->(" + nodes[end][0] + '),\n')

# to create a circular floor path, useful in some cases
def create_circular_relationship(l, create_nodes_and_edges2 = ""):
	# print(l)
	for i in range(len(l)):
		create_nodes_and_edges2 = create_nodes_and_edges2 + ' ({0})-[:neigh '.format(l[i][0]) +"{dist: " + euclidean_dist((l[i][1:4]), (l[(i+1)%len(l)][1:4])) + "}]->(" + l[(i+1)%len(l)][0] + '),\n'
		# create_nodes_and_edges2 = add_neighbor_path(i, l[(i+1)%len(l)], create_nodes_and_edges2)
		# create_nodes_and_edges2 = create_nodes_and_edges2 + ' ({0})-[:neigh '.format(l[(i+1)%len(l)][0]) +"{dist: " + euclidean_dist((l[i][1:3]), (l[(i+1)%len(l)][1:3])) + "}]->(" + l[i][0] + '),'
	return(create_nodes_and_edges2)


# graphDB_Driver  = GraphDatabase.driver(uri_to_server, auth=(usr, pwd))


# read nodes from csv file
f = open("mca.csv", "r")
nodes = []
for i in f.readlines():
	e = i.replace('"', '').replace('\t', '').split(',')
	try:
		nodes.append([e[0].strip(), float(e[1].strip()), float(e[2].strip()), int(e[3].strip()), "filter" if(len(e[4].strip()) == 0) else e[4].strip()])
	except Exception as ex:
		print(ex)
		print(e)
		nodes = []
		pass 

print(nodes)
f.close()

if(nodes == []):
	raise SystemExit(0)

# Starting the create query
create_nodes_and_edges = "CREATE"

# for i in nodes[:2]:
# 	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":purifier { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"

for i in nodes[0:-4]:
	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":room { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"

for i in nodes[-4:-3]:
	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":junction { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"

for i in nodes[-3:]:
	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":stairs { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"


# add_neighbor_path(, , create_nodes_and_edges)

# create relationships for floor 0
create_nodes_and_edges0 = create_circular_relationship(nodes[0:4])
# adding toilet 0 2,4
create_nodes_and_edges0 = add_neighbor_path(2, 4, create_nodes_and_edges0)


#create relationships for floor 1
create_nodes_and_edges1 = add_neighbor_path(5, 6)
create_nodes_and_edges1 = add_neighbor_path(27, 1)
create_nodes_and_edges1 = add_neighbor_path(27, 2)
# open terrace is connected to many rooms
for i in [6, 7, 8, 10]:
	create_nodes_and_edges1 = add_neighbor_path(9, i, create_nodes_and_edges1)
l = [10, 11, 12, 13, 14]
for i in l:
	for j in l:
		if(i != j):
			create_nodes_and_edges1 = add_neighbor_path(i, j, create_nodes_and_edges1)
for i in [10, 11, 14]:
	create_nodes_and_edges1 = add_neighbor_path(15, i, create_nodes_and_edges1)

# create relationships for floor 2
create_nodes_and_edges2 = add_neighbor_path(16, 17)
for i in [16, 17]:
	create_nodes_and_edges2 = add_neighbor_path(23, i, create_nodes_and_edges2)

create_nodes_and_edges2 = add_neighbor_path(23, 18, create_nodes_and_edges2)
create_nodes_and_edges2 = create_circular_relationship(nodes[18:22], create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(21, 22, create_nodes_and_edges2)

# create relationships for stairs
# stair at level i connects levels i and i+1
create_nodes_and_edges3 = add_neighbor_path(24, 25)
create_nodes_and_edges3 = add_neighbor_path(25, 26, create_nodes_and_edges3)
create_nodes_and_edges3 = add_neighbor_path(24, 0, create_nodes_and_edges3)
for i in [6, 7, 8, 9]:
	create_nodes_and_edges3 = add_neighbor_path(25, i, create_nodes_and_edges3)
for i in [16, 17]:
	create_nodes_and_edges3 = add_neighbor_path(26, i, create_nodes_and_edges3)

# # Adding water purifiers

# a, b = (0, 9)

# # combining all queries
create_nodes_and_edges = create_nodes_and_edges + create_nodes_and_edges0 + create_nodes_and_edges1 + create_nodes_and_edges2 + create_nodes_and_edges3
print(create_nodes_and_edges)

create_nodes_and_edges = create_nodes_and_edges[:-2] + ';'
# writing to a file for later use 
with open('mca.cypher', 'w') as f:
	f.write(create_nodes_and_edges)

# # connecting with the neo4j driver
# with graphDB_Driver.session() as graphDB_Session:
# 	graph_nodes = graphDB_Session.run(create_nodes_and_edges[:-1])
# 	# checking if the nodes where returned correctly
# 	res = graphDB_Session.run("MATCH(n) return n")
# 	print(res)


# graphDB_Driver.close()