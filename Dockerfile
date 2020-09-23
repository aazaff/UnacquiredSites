# Docker file for Unaquired Sites pipeline
# Socorro Dominguez, July, 2020

# use python:3 as the base image
FROM python:3

# install dependencies
# install numpy, pandas & matplotlib
RUN pip3 install numpy
RUN pip3 install pandas
RUN apt-get update && \
    pip3 install matplotlib && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install scikit-learn

RUN pip3 install nltk

RUN pip3 install argparse

RUN pip3 install plotly
RUN pip3 install dash


RUN pip3 install dash_html_components
RUN pip3 install dash_core_components
RUN pip3 install dash_table
RUN pip3 install dash
RUN pip3 install dash_extensions

COPY src/modules /app
RUN ls -alp /app

COPY output/predictions/ /app/input
COPY output/from_dashboard/ /app/output

WORKDIR /app
COPY . /app

CMD ["python3", "/app/dashboard/record_mining_dashboard.py", "--input_path=/app/input/predictions", "--output_path=/app/output/from_dashboard"]

# how to build the docker image
# docker build . -t my_first_xdd_app

# how to run image
# docker run -v /Your/full/path/UnacquiredSites/output/predictions/:/app/input -v /Your/full/path/UnacquiredSites/output/from_dashboard/:/app/output/from_dashboard -p 8050:8050 my_first_xdd_app:latest

# Example
# docker run -v /Users/seiryu8808/Desktop/UWinsc/Github/UnacquiredSites/output/predictions/:/app/input -v /Users/seiryu8808/Desktop/UWinsc/Github/UnacquiredSites/output/from_dashboard/:/app/output/from_dashboard -p 8050:8050 my_ninth_xdd_app:latest
