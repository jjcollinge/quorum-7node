# Quorum 7 Node
Quorum 7 node is a simple example of how to leverage the [Quorum Node](https://github.com/jjcollinge/quorum-node) repository to stand up new quorum nodes.

## Usage

1. Clone this repository to your local machine `git clone https://github.com/jjcollinge/quorum-7node.git`

2. Allow the example scripts to execute on your machine `chmod +x quorum-7node/example/run.sh`

3. Run the example script `./quorum-7node/example/run.sh`
 **WARNING** The initial build of the quorum-node docker image will take a little while, however, subsequent builds will use the local cache and will be considerably faster.

4. Once complete, you should have 7 running docker containers. These can be viewed by running the command `docker ps`. If you wish to inspect the geth instances running inside the containers, run the following commands:
    1. `docker exec -it <container-id> /bin/bash`
    2. `geth attach temp/data/geth.ipc`

5. (Optional) If you wish to enable the CakeShop dashboard, run the following commands:
`chmod +x /quorum-7node/cakeshop/init.sh && .//quorum-7node/cakeshop/init.sh 127.0.0.1 &`. This should run through the CakeShop initialisation routine. Once up and running you should see the Cakeship cake ASCII art in the console, you can now browse to http://localhost:8080/cakeshop/ to see the dashboard.

