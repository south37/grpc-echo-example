.PHONY: gen
gen:
	bundle exec grpc_tools_ruby_protoc -I ./protos --ruby_out=lib --grpc_out=lib ./protos/echo.proto

.PHONY: server
server:
	bundle exec ruby echo_server.rb
