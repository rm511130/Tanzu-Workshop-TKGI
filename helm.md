## Helm

```
Mac $ ssh -i ~/Downloads/fuse.pem ubuntu@user24.ourpcf.com
```
```
ubuntu@ip-10-0-0-38:~$ curl -O https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz
ubuntu@ip-10-0-0-38:~$ tar -zxvf helm-v2.14.1-linux-amd64.tar.gz
linux-amd64/
linux-amd64/LICENSE
linux-amd64/helm
linux-amd64/README.md
linux-amd64/tiller
ubuntu@ip-10-0-0-38:~$ sudo mv linux-amd64/helm /usr/local/bin/helm
sudo: unable to resolve host ip-10-0-0-38
ubuntu@ip-10-0-0-38:~$ helm
The Kubernetes package manager

To begin working with Helm, run the 'helm init' command:

	$ helm init

This will install Tiller to your running Kubernetes cluster.
It will also set up any necessary local configuration.

Common actions from this point include:

- helm search:    search for charts
- helm fetch:     download a chart to your local directory to view
- helm install:   upload the chart to Kubernetes
- helm list:      list releases of charts

Environment:

- $HELM_HOME:           set an alternative location for Helm files. By default, these are stored in ~/.helm
- $HELM_HOST:           set an alternative Tiller host. The format is host:port
- $HELM_NO_PLUGINS:     disable plugins. Set HELM_NO_PLUGINS=1 to disable plugins.
- $TILLER_NAMESPACE:    set an alternative Tiller namespace (default "kube-system")
- $KUBECONFIG:          set an alternative Kubernetes configuration file (default "~/.kube/config")
- $HELM_TLS_CA_CERT:    path to TLS CA certificate used to verify the Helm client and Tiller server certificates (default "$HELM_HOME/ca.pem")
- $HELM_TLS_CERT:       path to TLS client certificate file for authenticating to Tiller (default "$HELM_HOME/cert.pem")
- $HELM_TLS_KEY:        path to TLS client key file for authenticating to Tiller (default "$HELM_HOME/key.pem")
- $HELM_TLS_ENABLE:     enable TLS connection between Helm and Tiller (default "false")
- $HELM_TLS_VERIFY:     enable TLS connection between Helm and Tiller and verify Tiller server certificate (default "false")
- $HELM_TLS_HOSTNAME:   the hostname or IP address used to verify the Tiller server certificate (default "127.0.0.1")
- $HELM_KEY_PASSPHRASE: set HELM_KEY_PASSPHRASE to the passphrase of your PGP private key. If set, you will not be prompted for the passphrase while signing helm charts

Usage:
  helm [command]

Available Commands:
  completion  Generate autocompletions script for the specified shell (bash or zsh)
  create      create a new chart with the given name
  delete      given a release name, delete the release from Kubernetes
  dependency  manage a chart's dependencies
  fetch       download a chart from a repository and (optionally) unpack it in local directory
  get         download a named release
  help        Help about any command
  history     fetch release history
  home        displays the location of HELM_HOME
  init        initialize Helm on both client and server
  inspect     inspect a chart
  install     install a chart archive
  lint        examines a chart for possible issues
  list        list releases
  package     package a chart directory into a chart archive
  plugin      add, list, or remove Helm plugins
  repo        add, list, remove, update, and index chart repositories
  reset       uninstalls Tiller from a cluster
  rollback    roll back a release to a previous revision
  search      search for a keyword in charts
  serve       start a local http web server
  status      displays the status of the named release
  template    locally render templates
  test        test a release
  upgrade     upgrade a release
  verify      verify that a chart at the given path has been signed and is valid
  version     print the client/server version information

Flags:
      --debug                           enable verbose output
  -h, --help                            help for helm
      --home string                     location of your Helm config. Overrides $HELM_HOME (default "/home/ubuntu/.helm")
      --host string                     address of Tiller. Overrides $HELM_HOST
      --kube-context string             name of the kubeconfig context to use
      --kubeconfig string               absolute path to the kubeconfig file to use
      --tiller-connection-timeout int   the duration (in seconds) Helm will wait to establish a connection to tiller (default 300)
      --tiller-namespace string         namespace of Tiller (default "kube-system")

Use "helm [command] --help" for more information about a command.
ubuntu@ip-10-0-0-38:~$ 
```


-----------------------------------------------------

## Next

https://helm.sh/docs/using_helm/

https://github.com/helm/charts/tree/master/stable/prometheus

-----------------------------------------------------

## Operators

https://coreos.com/operators/prometheus/docs/latest/user-guides/getting-started.html#example-prometheus-operator-manifest








