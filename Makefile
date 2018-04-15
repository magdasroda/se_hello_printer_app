deps:
	pip install -r requirements.txt;
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test
<<<<<<< HEAD
=======

test:
	PYTHONPATH=. py.test

test_cov:
	PYTHONPATH=. py.test  --verbose -s --cov=.

test_xunit:	
	PYTHONPATH=. py.test  -s --cov=.  --junit-xml=test_results.xml



run:
	python main.py

docker_build:
	docker build -t $(MY_DOCKER_NAME) .

docker_run: docker_build
	docker run \
	--name $(SERVICE_NAME)-dev \
	-p 5000:5000 \
	-d $(MY_DOCKER_NAME)\

docker_stop:
	docker stop $(SERVICE_NAME)-dev

USERNAME=magdasroda
TAG=$(USERNAME)/$(MY_DOCKER_NAME)

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(MY_DOCKER_NAME) $(TAG); \
	docker push $(TAG); \
	docker logout;
>>>>>>> 7c88bab0b155c76725cc4bb22925b991ccedeaa0
