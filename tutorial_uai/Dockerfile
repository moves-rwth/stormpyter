FROM movesrwth/stormpy:1.7.0
MAINTAINER Matthias Volk <matthias.volk@cs.rwth-aachen.de>

WORKDIR /opt

# Should be already set in stormpy
#ENV STORM_DIR=/opt/storm
#ENV PATH="$STORM_DIR/build/bin:$PATH"

# Install jupyter, RISE and extensions
RUN pip install jupyter
RUN pip install RISE
RUN pip install jupyter_contrib_nbextensions
RUN pip install hide_code
RUN pip install nbconvert==6.4.3

# Dedicated directory for jupyter
RUN mkdir jupyter
WORKDIR /opt/jupyter
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable splitcell/splitcell
RUN jupyter nbextension install --py hide_code --user
RUN jupyter nbextension enable --py hide_code
RUN jupyter serverextension enable --py hide_code

# Install python libraries
RUN pip install matplotlib

# Development (could be disabled for release)
RUN jupyter nbextension enable spellchecker/main

# Copy files for notebook
RUN mkdir notebooks
COPY *.css notebooks/
COPY *.ipynb notebooks/
COPY examples notebooks/examples

# Starting
WORKDIR /opt/jupyter/notebooks
ENTRYPOINT ["jupyter", "notebook", "--port=8080", "--ip=0.0.0.0", "--allow-root"]

