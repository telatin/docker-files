FROM debian:buster-slim

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:/viromeqc:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
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

RUN conda install -y -c bioconda samtools bowtie2 pysam biopython pandas diamond

WORKDIR "/"
RUN hg clone https://bitbucket.org/CibioCM/viromeqc
WORKDIR "/viromeqc"
RUN python3  viromeQC.py --install
RUN chmod +x viromeQC.py
#CMD [ "/bin/bash" ]

#    Bowtie2 >= v. 2.3.4
#    Samtools >= 1.3.1
#    Biopython >= 1.69
#    Pysam >= 0.14
#    Diamond (tested on v.0.9.9 and 0.9.29)
#    Python3 (tested on 3.6)
#    pandas >= 0.20


