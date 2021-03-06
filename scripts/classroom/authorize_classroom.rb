#! /usr/bin/env ruby
require 'yaml'

if `facter -p pe_version`.split('.')[1].to_i > 3
  puts "This script is deprecated as of Puppet Enterprise 3.7"
  exit 1
end

hosts = {}
`puppet cert list --all`.split("\n").each do |line|
  if line =~ /^\+\s"(\S*.puppetlabs.vm)"\s.*$/
    hosts[$1] = { 'role' => 'read-write' }
  end
end

File.open('/etc/puppetlabs/console-auth/certificate_authorization.yml', 'w') do |f|
  f.write hosts.to_yaml
end

system('service pe-httpd restart')
