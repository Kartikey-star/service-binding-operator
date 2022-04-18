
# Service Binding Operator Helm Chart

This helm chart defines the Service Binding Operator. This provides an option for users to install  service binding operators using helm chart. 

The chart installation will result in the creation of three Custom Resource Definitions(CRDs):
- bindablekinds.binding.operators.coreos.com
- servicebindings.binding.operators.coreos.com
- servicebindings.servicebinding.io

The resources required for service binding operator will also be installed. The chart creates a service-binding-operator namespace and installs the required resources in that namespace. 

## Introduction

The following are the values that can be customized when the chart is installed:

- image.pullPolicy
- image.tag
- is_openshift

The is_openshift value signifies whether installing the operator on openshift or non openshift cluster. The value is set to true for openshift and false for non openshift.

A user can define values for the Tag and PullPolicy. A  User can obtain tag from https://github.com/redhat-developer/service-binding-operator/tags to get the desired version of service binding operator. The image tag can be obtained from quay.io/redhat-developer/servicebinding-operator using the tag mentioned above. For example , search quay.io/redhat-developer/servicebinding-operator using 31151ab (release tag of v1.0.1) to obtain image tag  31151ab8. By default the chart points out to the latest version.

## Helm Chart Installation 

The helm chart installation involves the following steps:
- Add the helm chart repository
- Install the chart
- Helm test

Note: If service binding operator is not installed through OLM, the operator requires that cert-manager is available on the cluster. It can be installed by:

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.0/cert-manager.yaml

### Add the helm chart repository
You need to add our helm repository to your local repository. Name the repository as per your convenience.  

```
helm repo add service-binding-operator https://redhat-developer.github.io/service-binding-operator-helm-chart/
```

### Install the helm chart
```
helm install service-binding-operator https://redhat-developer.github.io/service-binding-operator-helm-chart/service-binding-operator
```
You can check whether the chart is succesfully installed by running the following command

```
kubectl get pods -n service-binding-operator

```

### Helm test

In order to test the chart the user is expected to create a secret (specify the namespace if applicable), named my-k-config from his kubeconfig .

NOTE:
In case you are installing the chart on AWS eks cluster then you need to modify the aws-auth configmap.
```
kubectl edit -n kube-system cm/aws-auth 
```
Please add -system:masters to mapRoles and save.
After editing the config map you need to update the eks kubeconfig
```
aws eks update-kubeconfig --name <cluster-name>
```
Then Continue with the following steps.

```
kubectl create secret generic my-k-config --from-file=<PATH to your kubeconfig>
```

Run the helm test (specify the namespace if applicable) using :

```
helm test service-binding-operator
```

Please ensure to delete the secret (specify the namespace if applicable) created :
```
kubectl delete secret my-k-config
```

## Additional Help
Please reach out to us for any additional queries by creating an issue on https://github.com/redhat-developer/service-binding-operator/issues.
