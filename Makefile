setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.udacity-capstone
	source ~/.udacity-capstone/bin/activate

install:
	pip install -r requirements.txt

lint:
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
	sudo chmod +x /bin/hadolint
	hadolint Dockerfile
	pylint --disable=R,C app.py

all: install lint