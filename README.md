# Quorum 7 Node
Quorum 7 node is a simple example of how to leverage the [Quorum Node](https://github.com/jjcollinge/quorum-node) repository to stand up new quorum nodes.

## Run the 7 node example

1. Clone this repository to your local machine
```
git clone https://github.com/jjcollinge/quorum-7node.git
```

2. Allow the example scripts to execute on your machine
```
chmod +x quorum-7node/example/run.sh
```

3. Execute the `run.sh` script to run the example
```
cd ./quorum-7node/example/ && ./run.sh
```

 **WARNING** The initial build of the quorum-node docker image will take a little while, however, subsequent builds will use the local cache and will be considerably faster.

4. Once the execution is complete, you will have 7 running docker containers. Each will execute an initialisation script on startup to set itself up as a Quorum node based on a provide configuration. If this initialisation is successful, the nodes should be connected to each other and ready to operate.

## Run Cakeshop dashboard
[Cakeshop](https://github.com/jpmorganchase/cakeshop) can be quickly bolted on to your 7 node example by running the following commands.

1. Set the permission of the cakeshop script to executable and then invoke the cakeshop initialisation script with the IP address of an accessible geth instance.
```
cd ./quorum-7node/cakeshop && \
chmod +x ./init.sh && \
nohup ./init.sh 127.0.0.1 & 2>> cakeshop.log
```
 **WARNING** The cakeshop initialisation script is configured to use hard coded Geth ports for the 7 node example. If you have modified the Geth ports you will need to manually configure cakeshop using the instruction on the [Cakeshop docs](https://github.com/jpmorganchase/cakeshop).

2. Once the Cakeshop setup routine has completed you can view the dashboard by browsing to `http://localhost:8080/cakeshop`

## Run .NET Core Web App (WIP)
I am also bolting on a .NET Core Web App as an example. This is currently under development under the `quorum-7node/web/` directory.

