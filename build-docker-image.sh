# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker

# build the docker image
sudo docker build -t ci-cd-docker-beginner .

# login to your docker hub account
cat ~/my_password.txt | sudo docker login --username chetseig9 --password-stdin

# use the docker tag command to give the image a new name
sudo docker tag ci-cd-docker-beginner chetseig9/ci-cd-docker-beginner

# push the image to your docker hub repository
sudo docker push chetseig9/ci-cd-docker-beginner

# start the container to test the image 
sudo docker run -dp 80:80 chetseig9/ci-cd-docker-beginner

# referances
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-container-image.html
# https://docs.docker.com/get-started/02_our_app/
# https://docs.docker.com/engine/reference/commandline/login/#provide-a-password-using-stdin