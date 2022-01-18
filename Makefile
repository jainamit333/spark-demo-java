

MVN_OPTIONS := --quiet
VERSION := None

BUILD_PATH := $(CURDIR)/tmp
JAR_PATH := $(CURDIR)/target
JAR_NAME := sparkdemojava-spark-sql_2.12_scala_3.1.2.jar
DOCKER_REPO := jainamit333
TAG ?= NONE
JOB_NAME ?= NONE

clean:
	@echo "Will Clean the Project"
	rm -rf $(BUILD_PATH)
	mvn ${MVN_OPTIONS} clean

build: clean
	@echo "Will Build the Project"
	mkdir -p $(BUILD_PATH)
	mvn ${MVN_OPTIONS} install
	mv $(JAR_PATH)/$(JAR_NAME) $(BUILD_PATH)/spark_model.jar

create-image:build
	@echo "Will create new docker image"
	$(MAKE) check-job-name-defined
	$(MAKE) check-tag-defined
	docker build -t $(DOCKER_REPO)/$(JOB_NAME):$(TAG) .

push-image:create-image
	docker push $(DOCKER_REPO)/$(JOB_NAME):$(TAG)


check-tag-defined:
ifeq ($(TAG), NONE)
	$(error Undefined TAG, for the docker image)
endif

check-job-name-defined:
ifeq ($(JOB_NAME), NONE)
	$(error Undefined Job Name, for the docker image)
endif