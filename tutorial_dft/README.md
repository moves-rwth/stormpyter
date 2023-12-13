# Storm-dft tutorial

The directory contains Jupyter notebooks demonstrating the use of Storm-dft for the analysis of Dynamic Fault Trees (DFT).


## Following the presentation

The presentation is interactive.
All commands can be executed in the presentation and will be executed in the Docker container.

- Navigate forwards with `spacebar` and backwards with `shift+spacebar`.
- All interactive commands can be executed with `shift+enter`.
- Switch between presentation and the notebook with `alt+r`.


## Installation steps

1. Install Docker for your OS according to [these instructions](https://docs.docker.com/get-docker/).

2. Download and start the Docker container from the command line:

```
docker run -it -p 8080:8080 --name stormpyter mvolk/stormpyter:dft23
```
(Please note that the download with >1GB might take a while.)

3. Open the Jupyter website which is indicated in the command line and starts with `127.0.0.1:8080/?token=...`

4. On the website, open the notebook `tutorial.ipynb`.
The presentation should start automatically.


## Manual build
Instead of downloading the Docker container, you can also build it manually with:
```
docker build -t mvolk/stormpyter:dft23 -f Dockerfile .
```
and afterwards continue with step 3.

