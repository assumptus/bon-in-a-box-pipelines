#!bin/sh

# Windows path conversion from C:\somedir\somefile to /c/somedir/somefile
export HOST_PATH=$(echo $PIPELINE_REPO_PATH | sed -e 's/^C:/\/c/' -e 's/\\/\//g')
echo "Run in $HOST_PATH"

docker-compose -f /scripts/data/getGBIFParquet/docker/docker-compose.yaml build
docker-compose -f /scripts/data/getGBIFParquet/docker/docker-compose.yaml run pc-dock python -u /home/jovyan/scripts/data/getGBIFParquet/getGBIFParquet.py ${1}
