# docker-elasticsearch-curator
#### For curator v4
Example elasticsearch-curator docker image that includes an externally editable curator config files. This image is meant to be run on the same host that runs the elasticsearch container. If on separate servers, edit the config.yml to point at that server.

- Curator.yml is the Action file
- Config.yml is the Curator configuration file

Run container by using "docker run --rm --name curator --link *ELASTICSEARCH-CONTAINER* asynchrony/docker-elasticsearch-curator"



