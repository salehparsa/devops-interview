ENV  := $(shell echo $${ENV:-dev} | awk '{print tolower($$0)}')


all:
	@echo "Usage: make <get|describe|logs|apply>"

get: check-env
	kubectl get pod

describe: check-env
	kubectl describe deployment devops-interview

logs: check-env
	kubectl logs -lapp=devops-interview

apply: check-env
	kubectl apply -f k8s/app/.

.PHONY: apply check-env
SHELL := /bin/bash