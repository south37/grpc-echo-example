# grpc-echo-example
This is an example of Echo service written with gRPC.

## Setup
Please execute `bundle install` to install `grpc` and `grpc-tools` gems.

```console
bundle install
```

## Start gRPC server
Simply execute `make server`. Then, echo server will start and listen on port 50051.

```console
$ make server
bundle exec ruby echo_server.rb
I, [2019-03-29T22:52:15.653865 #64027]  INFO -- : ... running insecurely on 0.0.0.0:50051
```

Next, open another tab and execute the following command to send request to the echo server.

```console
$ bundle exec ruby echo_client.rb "Hello World"
echo response: "Hello World"
```

Congrats! You communicated with the echo server using gRPC!

Server log also shows the echo message.

```console
$ make server
bundle exec ruby echo_server.rb
I, [2019-03-29T22:52:15.653865 #64027]  INFO -- : ... running insecurely on 0.0.0.0:50051
I, [2019-03-29T22:53:50.961162 #64027]  INFO -- : echo "Hello World"
```

## How to Hack
Service definition is written in protos/echo.proto. Edit this file if you want to update the service definition.

The server implementation is written in echo_server.rb. If you want to update the logic, please edit this.
