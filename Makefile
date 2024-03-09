install:
	pip install --upgrade pip && pip install -r requirements.txt

lint: 
	pylint --disable=R,C *.py mylib/*.py

test:
	python -m pytest --cov=mylib test_logic.py

deploy:
	#deploy
format:
	#format
	black mylib/*.py
	
all: install lint test deploy