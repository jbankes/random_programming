#!/bin/bash

docker run -it --mount type=bind,source="$(pwd)",target=/go golang /bin/bash 
