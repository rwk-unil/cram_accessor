# CRAM Accessor
Accessing CRAMs on UKBiobank for testing

## Run on DNANexus

* The `-t` option is for number of threads (put 0 to let it choose).
* The `--cram-path` option is to specify a directory where there are CRAM files, the software will do random accesses in those files.
* Replace the path in `-iimage_file` to where your docker image is (you can download it [here](https://github.com/rwk-unil/cram_accessor/releases/download/v1.0/cram_accessor_v1.0.tar.gz)).

```shell
dx run swiss-army-knife -icmd="echo \"$(date)\"; cd /usr/src/cram_accessor/; git pull; make; time ./cram_accessor -t 12 --cram-path \"/mnt/project/Bulk/Whole genome sequences/Whole genome CRAM files/20\"" \
    --name CRAM_Accessor \
    -iimage_file=docker/cram_accessor_v1.0.tar.gz \
    --instance-type mem2_ssd1_v2_x4 -y
```

## Build Docker image

```shell
cd Docker
docker build -t cram_accessor:v1.0 .
# Takes some time !
time docker save cram_accessor:v1.0 | gzip > cram_accessor_v1.0.tar.gz
```

## Build locally

If you don't have HTSLIB

```shell
git submodule update --init --recursive htslib
cd htslib
autoreconf -i
./configure
make
make install
ldconfig
cd ..
make
```

If you have it installed, either :

```shell
git submodule update --init --recursive htslib
cd htslib
autoreconf -i
./configure
make
cd ..
make
```

or :

```shell
# Edit the Makefile and set the correct paths
make
```