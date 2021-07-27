#!/usr/bin/env bash

if [ -d "environments/$BRANCH_NAME/" ]; then
    cd environments/$BRANCH_NAME/gcp
    echo "*************** TERRAFORM INIT ******************"
    echo "******* At Branch/Env: $BRANCH_NAME ********"
    echo "*************************************************"
    for dir in us-east1/*/
    do 
        cd ${dir}
        module=${dir%*/}
        module=${module#*/}
        echo "******* At Module: ${module} ********"
        ../../../../../cloudbuild/simple-anthos-build/bettergrunt_init.sh
        cd ../../
    done
else
    for dir in environments/*/
    do 
        cd ${dir}
        env=${dir%*/}
        env=${env#*/}
        echo ""
        echo "*************** TERRAFORM INIT ******************"
        echo "******* At environment: ${env} ********"
        echo "*************************************************"
        cd gcp
        ../../../cloudbuild/simple-anthos-build/bettergrunt_init.sh || exit 1
        cd ../../../
    done
fi