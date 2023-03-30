# cram_accessor
Accessing CRAMs on UKBiobank for testing

# Build Docker image

```shell
cd Docker
docker build -t cram_accessor:v1.0 .
# Takes some time !
time docker save cram_accessor:v1.0 | gzip > cram_accessor_v1.0.tar.gz
```

# Build locally

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