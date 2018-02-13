package 'tree' do
	action :install
end

package 'emacs'

package 'ntp'

package 'git' do
	action :install
end


file '/etc/motd' do
	content 'Property of Gilberto Graham'
	action :create
	owner 'root'
	group 'root'
end

service 'ntpd' do
	action [ :enable, :start ]
end
