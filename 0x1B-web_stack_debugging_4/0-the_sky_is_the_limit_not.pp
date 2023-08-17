# This Puppet manifest increases the ULIMIT for Nginx, improving its traffic handling capacity.

exec { 'increase-nginx-ulimit':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/bin:/bin',
  onlyif  => 'grep -q "15" /etc/default/nginx',
  require => File['/etc/default/nginx'],
} 

exec { 'restart-nginx':
  command => '/etc/init.d/nginx restart',
  path    => '/usr/sbin:/sbin',
  require => Exec['increase-nginx-ulimit'],
}



