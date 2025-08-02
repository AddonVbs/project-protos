PROTOS := $(shell find proto -type f -name '*.proto')
OUT_DIR := .

generate:
	protoc \
	  --proto_path=proto \
	  --go_out=$(OUT_DIR)        --go_opt=paths=source_relative \
	  --go-grpc_out=$(OUT_DIR)   --go-grpc_opt=paths=source_relative \
	  $(PROTOS)

clean:
	find . -name '*.pb.go' -delete
