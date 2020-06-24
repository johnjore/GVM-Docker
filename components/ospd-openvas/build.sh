  
#!/usr/bin/env bash

APP="ospd-openvas"

STAGE="${1}"
[[ "${STAGE}" == "" ]] && STAGE="stable"

source "./${STAGE}"

git clone https://github.com/greenbone/ospd-openvas.git \
&& cd ospd-openvas \
&& git reset --hard ${COMMIT} \
&& python3 setup.py install