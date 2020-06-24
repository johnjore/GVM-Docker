#!/usr/bin/env bash

set -e

# default - vars
STAGE="stable"
[ -z "${BUILD}" ] && BUILD="-20200613"

# build gvmlibs
echo "
################################################################################
################### Build gvmlibs ##############################################
################################################################################"
gvmlibs_version=11.0
build_gvmlibs="${BUILD}"
docker build -f ./Dockerfile-gvmlibs --build-arg STAGE=${STAGE} \
  -t "securecompliancesolutions/gvmlibs:${gvmlibs_version}${build_gvmlibs}" \
  -t "securecompliancesolutions/gvmlibs:latest" .

# build gvmd
echo "
################################################################################
################### Build gvmd #################################################
################################################################################"
gvmd_version=9.0
build_gvmd="${BUILD}"
docker build -f ./Dockerfile-gvmd --build-arg STAGE=${STAGE} \
  -t "securecompliancesolutions/gvmd:${gvmd_version}${build_gvmd}" \
  -t "securecompliancesolutions/gvmd:latest" .

# build openvas
echo "
################################################################################
################### Build openvas ##############################################
################################################################################"
openvas_version=7.0
build_openvas="${BUILD}"
docker build -f ./Dockerfile-openvas --build-arg STAGE=${STAGE} \
  -t "securecompliancesolutions/openvas:${openvas_version}${build_openvas}" \
  -t "securecompliancesolutions/openvas:latest" .

# build gsa
echo "
################################################################################
################### Build gsa ##################################################
################################################################################"
gsa_version=9.0
build_gsa="${BUILD}"
docker build -f ./Dockerfile-gsa --build-arg STAGE=${STAGE} \
  -t "securecompliancesolutions/gsa:${gsa_version}${build_gsa}" \
  -t "securecompliancesolutions/gsa:latest" .

# build postgres
echo "
################################################################################
################### Build postgres #############################################
################################################################################"
postgres_version=9.6
build_postgres="${BUILD}"
docker build -f ./Dockerfile-postgres --build-arg STAGE=${STAGE} \
  -t "securecompliancesolutions/postgres:${postgres_version}${build_postgres}" \
  -t "securecompliancesolutions/postgres:latest" .

postgres_gvm_version=9.6
build_postgres_gvm="${BUILD}"
docker build -f ./Dockerfile-postgres-gvm --build-arg STAGE=${STAGE} \
  -t "securecompliancesolutions/postgres-gvm:${postgres_gvm_version}${build_postgres_gvm}" \
  -t "securecompliancesolutions/postgres-gvm:latest" .

# push
if [ "${1}" == "push" ]; then
  docker push "securecompliancesolutions/gvmlibs:${gvmlibs_version}${build_gvmlibs}"
  docker push "securecompliancesolutions/gvmlibs:latest"

  docker push "securecompliancesolutions/gvmd:${gvmd_version}${build_gvmd}"
  docker push "securecompliancesolutions/gvmd:latest"

  docker push "securecompliancesolutions/openvas:${openvas_version}${build_openvas}"
  docker push "securecompliancesolutions/openvas:latest"

  docker push "securecompliancesolutions/gsa:${gsa_version}${build_gsa}"
  docker push "securecompliancesolutions/gsa:latest"

  docker push "securecompliancesolutions/postgres:${postgres_version}${build_postgres}"
  docker push "securecompliancesolutions/postgres:latest"

  docker push "securecompliancesolutions/postgres-gvm:${postgres_gvm_version}${build_postgres_gvm}"
  docker push "securecompliancesolutions/postgres-gvm:latest"
fi