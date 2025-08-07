PROTO_DIRS := proto/user proto/task
OUT_DIR := .

PROTOS := $(foreach dir,$(PROTO_DIRS),$(wildcard $(dir)/*.proto))

gen:
	protoc \
		--go_out=$(OUT_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative \
		$(PROTOS)

clean:
	find . -name "*.pb.go" -delete
