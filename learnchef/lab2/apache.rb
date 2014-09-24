package "httpd"

# `service httpd start`

service 'httpd' do
  action :start
end

file "/var/www/html/index.html" do
  content "<h1>hello world</h1>\n"
end
