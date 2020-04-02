#!/bin/bash -e
# v 0.0.3

# get-pks-k8s-config.sh
# gmerlin@vmware.com & pblum@pivotal.io


function usage()
{
    echo "PKS Kubeconfig Helper Script."
    echo ""
    echo "-h --help"
    echo "--API=[FQDN-OF-YOUR-PKS-API]"
    echo "--CLUSTER=[K8s-CLUSTER-MASTER-VIP]"
    echo "--USER=[LDAP-USER]"
    echo ""
    echo "example: ./get-pks-k8s-config.sh --API=api.pks.pks4u.com --CLUSTER=shared-cluster-k8s.pks4u.com --USER=user1"
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
            PKS_API=$VALUE
            ;;
        --CLUSTER)
            PKS_CLUSTER=$VALUE
            ;;
        --USER)
            PKS_USER=$VALUE
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
read -s PKS_PASSWORD
echo -n ""

# Collect Tokens from UAA
CURL_CMD="curl 'https://${PKS_API}:8443/oauth/token' -sk -X POST -H 'Accept: application/json' -d \"client_id=pks_cluster_client&client_secret=\"\"&grant_type=password&username=${PKS_USER}&password=\"${PKS_PASSWORD}\"&response_type=id_token\""
TOKENS=$(eval $CURL_CMD | jq -r '{id_token, refresh_token} | to_entries | map("\(.key)=\(.value | @sh)") | .[]')
eval $TOKENS

if [ $id_token = "null" ]; then
    echo "Auth Failed"
    exit 1
fi


# To validate TLS replace -insecure-skip-tls-verify=true with -certificate-authority=./${PKS_CLUSTER}-ca.crt and --embed-certs=true
kubectl config set-cluster ${PKS_CLUSTER} --server=https://${PKS_CLUSTER}:8443 --insecure-skip-tls-verify=true
kubectl config set-context ${PKS_CLUSTER} --cluster=${PKS_CLUSTER} --user=${PKS_USER}
kubectl config use-context ${PKS_CLUSTER}

kubectl config set-credentials ${PKS_USER} \
  --auth-provider oidc \
  --auth-provider-arg client-id=pks_cluster_client \
  --auth-provider-arg cluster_client_secret="" \
  --auth-provider-arg id-token=${id_token} \
  --auth-provider-arg idp-issuer-url=https://${PKS_API}:8443/oauth/token \
  --auth-provider-arg refresh-token=${refresh_token}

