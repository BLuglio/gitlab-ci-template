#!/bin/bash

if [ "${DATABASE_URL}" == "" ]; then
    echo "DATABASE_URL required"
    exit 1
fi

echo "Running npm install"
npm install
npm run grunt

echo "Capturing audit results"
npm audit --json > npm-audit.json

echo "Running db migration"
npm run prestart

echo "Running test"
npm test