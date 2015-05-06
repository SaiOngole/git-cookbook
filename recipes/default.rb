# TODO: Use cp to move files around
# TODO: Try symbolic links
# TODO: Install grails 2.4.4, java 8 and Java security policy
# TODO: Changing the environment variables

execute "sudo apt-get update"
log "Update was done"

if node['platform'] == "ubuntu" && node['platform_version'].to_f <= 10.4
	package "git-core"

else
	package "git"
end

if node[:platform_family] == 'debian'
	execute 'apt-get -q -y install firefox' 
	log "apt-get was used"
else
	package "firefox"
	log "package command was used"
end

directory "/var/lib/foo" do 
	owner 'root'
  	group 'root'
  	mode '0755'
  	action :create

end

file "/var/lib/foo/blah.txt" do
	owner 'root'
  	group 'root'
  	mode '0755'
  	action :create
end

log "Well that was too easy"