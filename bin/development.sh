#!/usr/bin/env bash

docker run -i -t --rm -v "$(pwd)":/app -p 4567:4567 photo-portfolio
