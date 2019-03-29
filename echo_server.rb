# Sample gRPC server that implements the Echo::Echo service.
#
# Usage: $ bundle exec ruby path/to/echo_server.rb

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'logger'
require 'grpc'
require 'echo_services_pb'

# EchoServer is simple server that implements the Echo::Echo service.
class EchoServer < Echo::Echo::Service
  EchoLogger = Logger.new(STDOUT)

  def echo(echo_req, _unused_call)
    EchoLogger.info("echo \"#{echo_req.message}\"")
    Echo::EchoResponse.new(message: echo_req.message)
  end
end

# main starts an RpcServer that receives requests to EchoServer at the sample
# server port.
def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  logger = Logger.new(STDOUT)
  logger.info("... running insecurely on 0.0.0.0:50051")
  s.handle(EchoServer)
  # Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to
  # gracefully shutdown.
  s.run_till_terminated_or_interrupted(['SIGHUP', 'SIGINT', 'SIGQUIT'])
end

main
