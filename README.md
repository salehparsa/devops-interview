# Introduction

This repository deploy a python application by building a docker container on K8s using GitHub Action

# Application

All files you need are in this GitHub repository.

This app is written in Python.
Also, this task is not about programming, so if you don't know Python and are skilled in Bash, it's ok.

Requirements:

- Python `3.6` (any other `3.x` should work too)
- PostgreSQL server
- Packages listed in `requirements.txt` 

This application counts unique visitors and uses a database to persist data.

Application endpoints:

- `/` - main page with all data shown
- `/version` - JSON response with current application version

## Files description

- `migrations` - directory with database migrations (see _Installation_) based on `alembic`
- `static` - just static files for serving UI
- `templates` - HTML template for main page
- `app.py` - main "executable" which contains all code
- `requirements.txt` - list of all Python packages needed to run the application
- `requirements.test.txt` - list of all Python packages needed for CI/CD tasks
- `version.txt` - text file with current version

## Installation

To install the application, follow these steps:

- Prepare a PostgreSQL database
- Install all required packages with `pip install -r requirements.txt`
- Set all required environment variables
- Apply all migrations with `flask db upgrade`
- Start application

For the last step, you can use different approaches - just choose one from [official docs][flask-deploy].

## Configuration

Generic Docker-ready applications can be easily configured via environment variables.

- `DATABASE_URL` (required) - connection string to your database, you can find examples [here][flask-sqlalchemy-connstr].
- `USER_NAME` - your name, which will be shown on the page
- `USER_URL` - some kind of personal URL

## Containerization

This repository contain a Dockerfile and docker-compose which includes both postgres and application.

## Testing 

All tools you need for this section are in `requirements.test.txt` file,
which can be easily installed with `pip install -r requirements.test.txt`.

- [ ] Linting
    - [ ] Code style<br/>
        Just use [flake8] and configuration from `setup.cfg`
    - [ ] Static typing<br/>
        This project can be verified with [mypy] static types checker, configuration for it can be found in `setup.cfg`
- [ ] Tests<br/>
    Can be run with `pytest.`
- [ ] Code coverage<br/>
    Checkout Python [Coverage] project, 
    or, you can get integration with [CodeCov] or [Coveralls] - they have free tiers.

## Continuous Integration/Deployment

For CI/CD, we are using GitHub Action by setting up secret in setting of the repository
    
## Monitoring

Since it is deployed on K8s we can setup monitoring and alerting via Grafana and Prometheus. I have working example [Here][https://github.com/salehparsa/terraform-linode-k8s] 

## Documentation

Technologies:
* Terraform - for main infrastructure of this project. Repository is available [Here][https://github.com/salehparsa/terraform-linode-k8s-action]
* GitHub Action - For CI/CD
* Docker - For making container

How to Start:

If you want to start locally, you can run `docker-compose up -d`. If you want to fork it, you just need to have a Linode API Key and setup the key and `kubeconfig` in your secrets of repository


# License

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)][license]
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License][license].
Adapted from https://github.com/soar/devops-test.

[github-clone]: git@github.com:blacklane/devops-interview.git
[github-repository]: https://github.com/blacklane/devops-interivew

[license]: http://creativecommons.org/licenses/by-sa/4.0/

[ansible]: https://www.ansible.com
[aws]: https://aws.amazon.com
[chef]: https://www.chef.io
[asciiflow]: http://asciiflow.com
[cloudcraft]: https://cloudcraft.co
[codecov]: https://codecov.io
[coverage]: https://coverage.readthedocs.io
[coveralls]: https://coveralls.io
[drawio]: http://draw.io
[flake8]: http://flake8.pycqa.org/en/latest/index.html
[flask]: http://flask.pocoo.org
[flask-deploy]: http://flask.pocoo.org/docs/1.0/deploying/#deployment
[flask-sqlalchemy-connstr]: http://flask-sqlalchemy.pocoo.org/2.3/config/#connection-uri-format
[gitlab-ci-yml]: https://docs.gitlab.com/ee/ci/yaml/
[iac]: https://en.wikipedia.org/wiki/Infrastructure_as_code
[jenkins-pipelines]: https://jenkins.io/doc/book/pipeline/
[mypy]: https://mypy.readthedocs.io/en/stable/index.html
[terraform]: https://www.terraform.io
[cloudformation]: https://aws.amazon.com/cloudformation/
