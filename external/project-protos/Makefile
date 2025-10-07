# Proto sources and output directory
PROTOS  := proto/**/*.proto
OUT_DIR := .

# Tools
PROTOC ?= protoc

.PHONY: tools check-protoc generate clean verify tidy

tools:
	@echo "Installing protoc plugins..."
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

check-protoc:
	@command -v $(PROTOC) >/dev/null 2>&1 || { \
		echo "ERROR: protoc не найден. Установите через MSYS2:"; \
		echo "  pacman -S --noconfirm --needed mingw-w64-x86_64-protobuf"; \
		exit 1; \
	}
	@$(PROTOC) --version

generate: check-protoc $(PROTOS)
	$(PROTOC) \
	  --go_out=$(OUT_DIR) --go_opt=paths=source_relative \
	  --go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative \
	  $(PROTOS)

clean:
	@find proto -name "*.pb.go" -delete

verify:
	@go list ./... >/dev/null
	@echo "OK"

tidy:
	@go mod tidy
