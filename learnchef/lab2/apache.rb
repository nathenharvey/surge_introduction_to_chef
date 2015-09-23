package 'apache2'

service 'apache2' do
  action :start
end

directory '/var/www/html' do 
  recursive true
end 

file '/var/www/html/index.html' do
  # action :create
  content "<h1>Hello, world!</h1>\n"
  mode '0755'
end


