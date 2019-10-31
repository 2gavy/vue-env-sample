#!/bin/sh
./generate_env-config.sh > ./dist/env-config.js
serve -s dist -l 5000