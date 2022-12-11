# requires neo4j module to run query directly from this script
from neo4j import GraphDatabase
import math

# credentials here to connect to database
usr = "neo4j"
uri_to_server = "bolt://localhost:7687"
pwd = "graphs"


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


graphDB_Driver  = GraphDatabase.driver(uri_to_server, auth=(usr, pwd))


# read nodes from csv file
f = open("ce1.csv", "r")
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

for i in nodes[0:-22]:
	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":room { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"

for i in nodes[-22:-7]:
	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":junction { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"

for i in nodes[-7:-1]:
	create_nodes_and_edges = create_nodes_and_edges + " (" + i[0] + ":stairs { " +  'id: "{0}", desc: "{1}"'.format(i[0], i[4]) + "}),\n"
create_nodes_and_edges = create_nodes_and_edges + " (" + nodes[-1][0] + ":room { " +  'id: "{0}", desc: "{1}"'.format(nodes[-1][0], nodes[-1][4]) + "}),\n"


# add_neighbor_path(, , create_nodes_and_edges)

# create relationships for floor 0
create_nodes_and_edges0 = add_neighbor_path(39, 10)
l = [0, 54, 1, 2, 3, 39, 4, 40, 41, 42, 43]
for i in range(len(l)-1):
	create_nodes_and_edges0 = add_neighbor_path(l[i], l[i+1], create_nodes_and_edges0)
create_nodes_and_edges0 = add_neighbor_path(40, 5, create_nodes_and_edges0)
create_nodes_and_edges0 = add_neighbor_path(41, 9, create_nodes_and_edges0)
create_nodes_and_edges0 = add_neighbor_path(42, 6, create_nodes_and_edges0)
create_nodes_and_edges0 = add_neighbor_path(42, 11, create_nodes_and_edges0)
create_nodes_and_edges0 = add_neighbor_path(43, 7, create_nodes_and_edges0)
create_nodes_and_edges0 = add_neighbor_path(43, 8, create_nodes_and_edges0)
create_nodes_and_edges0 = add_neighbor_path(39, 55, create_nodes_and_edges0)

#create relationships for floor 1
create_nodes_and_edges1 = add_neighbor_path(44, 23)
l = [12, 56, 13, 14, 15, 44, 16, 45, 46, 47, 48]
for i in range(len(l)-1):
	create_nodes_and_edges1 = add_neighbor_path(l[i], l[i+1], create_nodes_and_edges1)
create_nodes_and_edges1 = add_neighbor_path(45, 17, create_nodes_and_edges1)
create_nodes_and_edges1 = add_neighbor_path(45, 22, create_nodes_and_edges1)
create_nodes_and_edges1 = add_neighbor_path(47, 18, create_nodes_and_edges1)
create_nodes_and_edges1 = add_neighbor_path(47, 19, create_nodes_and_edges1)
# create_nodes_and_edges0 = add_neighbor_path(47, 11, create_nodes_and_edges0)
create_nodes_and_edges1 = add_neighbor_path(48, 20, create_nodes_and_edges1)
create_nodes_and_edges1 = add_neighbor_path(48, 21, create_nodes_and_edges1)
create_nodes_and_edges1 = add_neighbor_path(44, 57, create_nodes_and_edges1)

# # create relationships for floor 2
create_nodes_and_edges2 = add_neighbor_path(49, 59)
l = [25, 26, 58, 27, 28, 29, 49, 50, 51, 52, 53]
for i in range(len(l)-1):
	create_nodes_and_edges2 = add_neighbor_path(l[i], l[i+1], create_nodes_and_edges2)
for i in [30, 31, 38]:
	create_nodes_and_edges2 = add_neighbor_path(49, i, create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(50, 32, create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(50, 37, create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(51, 33, create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(51, 36, create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(52, 60, create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(53, 34, create_nodes_and_edges2)
create_nodes_and_edges2 = add_neighbor_path(53, 35, create_nodes_and_edges2)



# create relationships for stairs
# stair at level i connects levels i and i+1
create_nodes_and_edges3 = add_neighbor_path(54, 56)
create_nodes_and_edges3 = add_neighbor_path(56, 58, create_nodes_and_edges3)
create_nodes_and_edges3 = add_neighbor_path(55, 57, create_nodes_and_edges3)
create_nodes_and_edges3 = add_neighbor_path(57, 59, create_nodes_and_edges3)

# # Adding water purifiers

# a, b = (0, 9)

# # combining all queries
create_nodes_and_edges = create_nodes_and_edges + create_nodes_and_edges0 + create_nodes_and_edges1 + create_nodes_and_edges2 + create_nodes_and_edges3
print(create_nodes_and_edges)

create_nodes_and_edges = create_nodes_and_edges[:-2] + ';'
# writing to a file for later use 
with open('ce1.cypher', 'w') as f:
	f.write(create_nodes_and_edges)

# # connecting with the neo4j driver
# with graphDB_Driver.session() as graphDB_Session:
# 	graph_nodes = graphDB_Session.run(create_nodes_and_edges[:-1])
# 	# checking if the nodes where returned correctly
# 	res = graphDB_Session.run("MATCH(n) return n")
# 	print(res)


# graphDB_Driver.close()