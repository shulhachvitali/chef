# action :preinstall do
#  template '/etc/yum.repos.d/nginx.repo' do
#    source 'nginx.erb'
#  end
# end

action :install do
  template '/etc/yum.repos.d/nginx.repo' do
    source 'nginx.erb'
  end
  package "nginx" do
    action :install
  end
end

action :setup do
  template '/usr/share/nginx/html/index.html' do
    source 'index.erb'
  end
end

action :stop do
  service 'nginx' do
    action :stop
  end
end

action :start do
  service 'nginx' do
    action :start
  end
end

action :restart do
  service 'nginx' do
    action :restart
  end
end

action :reload do
  service 'nginx' do
    action :reload
  end
end
