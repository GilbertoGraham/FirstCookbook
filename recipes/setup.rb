package 'tree' do
	action :install
end

package 'emacs'

package 'ntp'

package 'git' do
	action :install
end

#node['ipaddress']
#node['memory']['total'] 

# print statements "i have 4 apples"
#apple_count = 4
#puts "I have #{apple_count} apples"

file '/etc/motd' do
	content "Property of Gilberto Graham
	HOSTNAME: #{node['hostname']}
	IPADDRESS: #{node['ipaddress']} 
	CPU: #{node['cpu']['0']['mhz']}
	MEMORY:  #{node['memory']['total']}
"
	action :create
	owner 'root'
	group 'root'
end

service 'ntpd' do
	action [ :enable, :start ]
end
