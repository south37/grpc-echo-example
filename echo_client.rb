# Sample app that connects to a Echo::Echo service.
#
# Usage: $ bundle exec ruby path/to/greeter_client.rb [message]

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'echo_services_pb'

def main
  stub = Echo::Echo::Stub.new('localhost:50051', :this_channel_is_insecure)
  m = ARGV.size > 0 ?  ARGV[0] : 'hello'
  message = stub.echo(Echo::EchoRequest.new(message: m)).message
  print "echo response: \"#{message}\"\n"
end

main
