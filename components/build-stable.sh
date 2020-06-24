#!/usr/bin/env bash

set -e

# default - vars
STAGE="stable"
[ -z "${BUILD}" ] && BUILD=""

# build gvmlibs
echo "
################################################################################
################### Build gvmlibs ##############################################
################################################################################"
gvmlibs_version=11.0
build_gvmlibs="${BUILD}"
docker build -f /components/gvm-libs/Dockerfile --build-arg STAGE=${STAGE} 


# build gvmd
echo "
################################################################################
################### Build gvmd #################################################
################################################################################"
gvmd_version=9.0
build_gvmd="${BUILD}"
docker build -f /components/gvmd/Dockerfile --build-arg STAGE=${STAGE}

# build openvas
echo "
################################################################################
################### Build openvas ##############################################
################################################################################"
openvas_version=7.0
build_openvas="${BUILD}"
docker build -f /components/openvas/Dockerfile --build-arg STAGE=${STAGE} 


# build gsa
echo "
################################################################################
################### Build gsa ##################################################
################################################################################"
gsa_version=9.0
build_gsa="${BUILD}"
docker build -f /components/gsa/Dockerfile --build-arg STAGE=${STAGE} 


# build postgres

echo "
################################################################################
################### Build postgres #############################################
################################################################################"
postgres_version=9.6
build_postgres="${BUILD}"
docker build -f /components/postgres/Dockerfile --build-arg STAGE=${STAGE} 

postgres_gvm_version=9.6
build_postgres_gvm="${BUILD}"
docker build -f /components/postgres-gvm/Dockerfile --build-arg STAGE=${STAGE} 
