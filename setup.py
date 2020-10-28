from distutils.core import setup

from helpers.version import get_project_version

setup(
    name='devops-interview',
    version=get_project_version(),
    packages=[''],
    url='https://devops-interview',
    license='GNU GPLv3 ',
    author='Blacklane',
    author_email='me@email.com',
    description='DevOps Task for Interview'
)
