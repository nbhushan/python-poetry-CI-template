initialize_git:
	@echo "Initializing git..."
	git init 
	
install: 
	@echo "Installing..."
	poetry install --no-root

activate:
	@echo "Activating virtual environment"
	poetry shell

setup_precommit:
	@echo "Setting up pre-commit"
	pre-commit install

setup: initialize_git install activate setup_precommit

test:
	@echo "Running tests"
	poetry run pytest

testcov:
	@echo "Generating test coverage"
	poetry run pytest --cov 

format:
	@echo "Formatting code using Black"
	poetry run black hello_world_app.py

precommit:
	@echo "Running Pre-commit"
	poetry run pre-commit run --all-files

## Delete all compiled Python files
clean:
	@echo "Cleaning up the repo"
	find . -type f -name "*.py[co]" -delete
	find . -type f -name ".coverage" -delete
	find . -type d -name "__pycache__" -delete
	rm -rf .pytest_cache
