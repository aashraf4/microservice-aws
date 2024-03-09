install:
	pip install --upgrade pip && pip install -r requirements.txt

lint: 
	#pylint

test:
	#test

deploy:
	#deploy
format:
	#format
	black mylib/*.py
	
all: install lint test deploy