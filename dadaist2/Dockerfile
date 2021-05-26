FROM debian:buster-slim

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:/dadaist2/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates zip git && \
    apt-get clean

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.7.12-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

RUN conda install -y -c conda-forge mamba
RUN mamba install -y -c conda-forge -c bioconda  multiqc vsearch
RUN mamba install -y -c conda-forge -c bioconda  dadaist2 --only-deps

WORKDIR "/"
RUN git clone https://github.com/quadram-institute-bioscience/dadaist2

WORKDIR "/dadaist2"
RUN mkdir -p ./refs
RUN ./bin/dadaist2-getdb -d dada2-rdp-train-16 -o /dadaist2/refs/
RUN rm -rf data docs validation nextflow multiqc
