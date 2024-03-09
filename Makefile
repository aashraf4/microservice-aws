install:
	pip install --upgrade pip && pip install -r requirements.txt

post-install:
	python -m textblob.download_corpora
lint: 
	pylint --disable=R,C *.py mylib/*.py

test:
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	#docker build -t deploy-fastapi .
deploy:
	aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 608792983808.dkr.ecr.eu-central-1.amazonaws.com
	docker build -t microservice-aws-example .
	docker tag microservice-aws-example:latest 608792983808.dkr.ecr.eu-central-1.amazonaws.com/microservice-aws-example:latest
	docker push 608792983808.dkr.ecr.eu-central-1.amazonaws.com/microservice-aws-example:latest
	
format:
	#format
	black mylib/*.py

all: install post-install lint test format deploy