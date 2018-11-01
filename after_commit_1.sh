#!/bin/bash

# 2482a2cb640df4cf45c50ffcee30b29ae8c0ce1b

set -ex

get_help() {
    url=$1
    img=$2
    singularity pull ${url} 2>/dev/null 1>&2
    singularity help ${img} | grep '.'
}

get_help shub://BenLangmead/singularity-test \
	 ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test-master-latest.simg
rm -f ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test*

# This doesn't work:
# get_help shub://BenLangmead/singularity-test:master
# Gives: ERROR Cannot find image. Is your capitalization correct?

get_help shub://BenLangmead/singularity-test@master \
	 ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test-master-latest.simg
rm -f ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test*

get_help shub://BenLangmead/singularity-test:suffix \
	 ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test-master-suffix.simg
rm -f ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test*

# OK, this one is odd.  Seems to just completely ignore my specified suffix.
get_help shub://BenLangmead/singularity-test@suffix \
	 ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test-master-latest.simg
rm -f ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test*

get_help shub://BenLangmead/singularity-test@2482a2cb640df4cf45c50ffcee30b29ae8c0ce1b \
	 ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test-master-latest.simg
rm -f ${SINGULARITY_CACHEDIR}/BenLangmead-singularity-test*


