docker build -t myclang:18.04 .

docker container run -it -d --name myclang myclang:18.04

docker container exec -it myclang /bin/bash
