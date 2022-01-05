docker build --tag rjordan .
# docker run -p 8080:80 -d --name pyr pyr
# docker run -it --name pyr pyr

docker tag pyr jmbarbone/rjordan
docker push jmbarbone/rjordan
