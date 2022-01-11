IMG ?= terraform-runner:latest

docker-build: test
	docker build -t ${IMG} .

.PHONY: fmt
fmt: ## Run go fmt against code.
	go fmt ./...

.PHONY: vet
vet: ## Run go vet against code.
	go vet ./...

build: fmt vet
	go build -o bin/manager main.go

run: build
	go run ./main.go

.PHONY: test
test:
	go test ./... -coverprofile cover.out