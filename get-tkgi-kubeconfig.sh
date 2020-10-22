#!/bin/bash -e
# v 0.0.4

# rmeira@vmware.com's update to https://github.com/Tanzu-Solutions-Engineering/tkgi-workshop/blob/master/get-tkgi-k8s-config.sh
# originally written by gmerlin@vmware.com & pblum@pivotal.io
# This version of the script refers to TKGI instead of TKGI

function usage()
{
    echo "TKGI Kubeconfig Helper Script."
    echo ""
    echo "-h --help"
    echo "--API=[FQDN-OF-YOUR-TKGI-API]"
    echo "--CLUSTER=[K8s-CLUSTER-MASTER-VIP]"
    echo "--USER=[LDAP-USER]"
    echo ""
    echo "example: ./get-tkgi-kubeconfig.sh --API=api.tkgi.tkgi4u.com --CLUSTER=k8s-cluster.tkgi4u.com --USER=user1"
}

if [ "$#" -ne 3 ]; then
        usage
        exit 1
fi

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --API)
            TKGI_API=$VALUE
            ;;
        --CLUSTER)
            TKGI_CLUSTER=$VALUE
            ;;
        --USER)
            TKGI_USER=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

#Prompt for Password
echo -n "Password:"
read -s TKGI_PASSWORD
echo -n ""

# Collect Tokens from UAA
CURL_CMD="curl 'https://${TKGI_API}:8443/oauth/token' -sk -X POST -H 'Accept: application/json' -d \"client_id=tkgi_cluster_client&client_secret=\"\"&grant_type=password&username=${TKGI_USER}&password=\"${TKGI_PASSWORD}\"&response_type=id_token\""
TOKENS=$(eval $CURL_CMD | jq -r '{id_token, refresh_token} | to_entries | map("\(.key)=\(.value | @sh)") | .[]')
eval $TOKENS

if [ $id_token = "null" ]; then
    echo "Auth Failed"
    exit 1
fi


# To validate TLS replace -insecure-skip-tls-verify=true with -certificate-authority=./${TKGI_CLUSTER}-ca.crt and --embed-certs=true
kubectl config set-cluster ${TKGI_CLUSTER} --server=https://${TKGI_CLUSTER}:8443 --insecure-skip-tls-verify=true
kubectl config set-context ${TKGI_CLUSTER} --cluster=${TKGI_CLUSTER} --user=${TKGI_USER}
kubectl config use-context ${TKGI_CLUSTER}

kubectl config set-credentials ${TKGI_USER} \
  --auth-provider oidc \
  --auth-provider-arg client-id=tkgi_cluster_client \
  --auth-provider-arg cluster_client_secret="" \
  --auth-provider-arg id-token=${id_token} \
  --auth-provider-arg idp-issuer-url=https://${TKGI_API}:8443/oauth/token \
  --auth-provider-arg refresh-token=${refresh_token}

