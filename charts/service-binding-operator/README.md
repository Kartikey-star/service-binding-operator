This helm chart defines Service Binding Operator. When the chart is installed it will provide the user with the oportunity to provide the image tag for service binding operator. The following are the values that can be customized when the chart is installed:

. PullPolicy
. Tag
. is_openshift

The is_openshift value signifies whether installing the operator on openshift or non openshift cluster. The value is set to true for openshift and false for non openshift.

The chart installation will result in the creation of three Custom Resource Definitions(CRDs) :
. bindablekinds.binding.operators.coreos.com
. servicebindings.binding.operators.coreos.com
. servicebindings.servicebinding.io
The resources required for service binding operator will also be installed.

A user can define values for the Tag and PullPolicy, from https://github.com/redhat-developer/service-binding-operator/tags to get the desired version of service binding operator.

