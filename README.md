## Spark Demo Job
This project is a poc to create a demo spark job to run on k8, with complete automation.


### Creation of Docker Image

Docker image creation automated via makefile.

```
make push-image TAG=<tag_of_docker_image> JOB_NAME=<job_name>
```

JOB_NAME will also be used to name the docker image.

#### Steps
1. Create a jar of the project.
2. Create docker image from the spark base image, with spark job jar inside the image.
3. Push the image to docker hub.

Spark jon jar will be located at "$SPARK_HOME/examples/spark_model.jar" inside the docker image. It will be used
to when spark submit/spark-on-k8 operator is called.