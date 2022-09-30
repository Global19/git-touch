#!/bin/bash

# https://docs.github.com/en/graphql/overview/public-schema
curl -o lib/gql_github/schema.graphql https://docs.github.com/public/schema.docs.graphql

flutter pub run build_runner watch --delete-conflicting-outputs
