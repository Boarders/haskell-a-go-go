#!/bin/bash

. haskell-files.sh

usage() {
  cat <<-ENDOFUSAGE
Usage: $(basename $0) [OPTION] [PROJECT-NAME]
  -c [name]  Start a new cabal project with given project name
  -S [name]  Start a new stack project with given project name
ENDOFUSAGE
  exit
}

function makeCabalProject {
    name="${@: -0}"
    echo ${name}
    if [[ ! -e ${name} ]]; then
        mkdir ${name}
    fi
    cd ${name}
    mkdir "src"
    mkdir "app"
    makeCabalFile ${name}
}
function MakeStackProject {
    projet_name = "${@: -0}"
    }


while getopts 'hc:s:' flag; do
  case ${flag} in
    h)
      # help flag
      usage
      exit 1
      ;;
    c)
      # cabal flag
      echo ${OPTARG}
      makeCabalProject ${OPTARG}
      exit 1
      ;;
    s)
      # shell flag
      echo ${OPTARG}
      exit 1
      ;;
  esac
done
