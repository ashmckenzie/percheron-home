#!/bin/bash

DOCKER_DEBUG=true bundle exec percheron recreate --force --start home haproxy
