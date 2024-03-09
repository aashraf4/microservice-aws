install:
	pip install --upgrade pip && pip install -r requirements.txt

post-install:
	python -m textblob.download_corpora
lint: 
	pylint --disable=R,C *.py mylib/*.py

test:
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	docker build -t deploy-fastapi .
deploy:
	#deploy
format:
	#format
	black mylib/*.py
	
all: install post-install lint test build format deploy