# Quorum 7 Node
Quorum 7 node is a simple example of how to leverage the [Quorum Node](https://github.com/jjcollinge/quorum-node) repository to stand up new quorum nodes.

## Usage

1. Clone this repository to your local machine `git clone https://github.com/jjcollinge/quorum-7node.git`

2. Allow the example scripts to execute on your machine `chmod +x quorum-7node/example/run.sh`

3. Run the example script from within the examples folder `cd ./quorum-7node/example/` and `./run.sh`
 **WARNING** The initial build of the quorum-node docker image will take a little while, however, subsequent builds will use the local cache and will be considerably faster.

4. Once complete, you should have 7 running docker containers. These can be viewed by running the command `docker ps`. If you wish to inspect the geth instances running inside the containers, run the following commands:
    1. `docker exec -it <container-id> /bin/bash`
    2. `geth attach temp/data/geth.ipc`

## CakeShop (Optional)
[CakeShop](https://github.com/jpmorganchase/cakeshop) can be quickly bolted on to your 7 node deployment by running the following commands.

1. `cd ./quorum-7node/cakeshop && chmod +x ./init.sh && ./init.sh 127.0.0.1` **WARNING** Without redirecting the output this command will hijack your terminal

2. Once the CakeShop setup routine has completed, you should see an ASCII art image of a lion and a cake. Now you can browse to the dashboard on http://localhost:8080/cakeshop

## Web (Optional)
I am also bolting on a .NET Core Web App as an example. This is currently under development under the `quorum-7node/web/` directory.
