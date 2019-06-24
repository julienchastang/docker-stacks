#!/bin/bash

conda install --quiet -y conda-build

cd /tmp

git clone https://github.com/julienchastang/jupyterhub -b quiet_exceptions

cd jupyterhub

python setup.py sdist --format=gztar

cp dist/jupyterhub-1.0.1.dev0.tar.gz /tmp/jupyterhub-1.0.1_jc.tar.gz

cd /tmp

git clone https://github.com/julienchastang/jupyterhub-feedstock

cd jupyterhub-feedstock/recipe

conda-build .

conda install --quiet -y jupyterhub=1.0.1_jc --use-local
