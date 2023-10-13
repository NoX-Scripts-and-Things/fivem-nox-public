#!/usr/bin/env bash

ls

pip3 install virtualenv
python3 -m venv venv
source venv/Scripts/activate
pip install -r requirements.txt
