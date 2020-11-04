ENV  := $(shell echo $${ENV:-dev} | awk '{print tolower($$0)}')

all:
	@echo "Usage: make <get|describe|logs|apply>"

get: check-env
	kubectl get pod

describe-app: check-env
	kubectl describe deployment devops-interview

logs-app: check-env
	kubectl logs -lapp=devops-interview

apply-app: check-env
	kubectl apply -f k8s/app/.

describe-db: check-env
	kubectl describe deployment postgres

logs-db: check-env
	kubectl logs -lapp=postgres

apply-db: check-env
	kubectl apply -f k8s/postgres/.

.PHONY: apply check-env
SHELL := /bin/bash