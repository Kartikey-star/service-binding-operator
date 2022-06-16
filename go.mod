module github.com/redhat-developer/service-binding-operator

go 1.16

require (
	github.com/go-logr/logr v0.4.0
	github.com/golang/mock v1.5.0
	github.com/onsi/ginkgo v1.16.4
	github.com/onsi/ginkgo/v2 v2.1.4 // indirect
	github.com/onsi/gomega v1.19.0
	github.com/operator-framework/api v0.3.8
	github.com/stretchr/testify v1.7.0
	golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
	k8s.io/api v0.22.1
	k8s.io/apiextensions-apiserver v0.22.1
	k8s.io/apimachinery v0.22.1
	k8s.io/client-go v0.22.1
	sigs.k8s.io/controller-runtime v0.10.0
)
