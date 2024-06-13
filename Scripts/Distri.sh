#!/bin/bash

# Change to the appropriate directory
cd dossier principal du projet || exit 1

# Activate the virtual environment
source Imove/bin/activate || exit 2

cd Scripts/ || exit 1

# Execute the Python script
python Distri.py || exit 3

# Exit with success code
exit 0
