require "spec"
require "http"
require "../src/selenium"
require "./support/**"

server = TestServer.new(3002)

Spec.before_each do
  TestServer.reset
end

Spec.after_suite do
  server.close
end

spawn do
  server.listen
end

def with_session(http_client : Selenium::HttpClient)
  session_id = Selenium::Command::NewSession.new(http_client).execute
  yield(session_id)
ensure
  Selenium::Command::DeleteSession.new(http_client, session_id).execute unless session_id.nil?
end
