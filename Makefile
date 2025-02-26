build:
	@go build -o api cmd/main.go

commit:
	@cz c

lint:
	@golangci-lint run

generate-docs:
	@swag init --dir cmd/

run:
	@go run cmd/main.go

setup:
	@brew install commitizen go@1.23 golangci-lint
	@brew upgrade golangci-lint
	@go install golang.org/x/tools/gopls@latest

test:
	@go test -v -race -failfast -coverprofile=coverage.out ./...
	@go tool cover -func=coverage.out