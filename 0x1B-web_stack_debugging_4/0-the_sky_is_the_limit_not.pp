# Adjusts the worker_processes in nginx.conf to improve request handling.

exec { 'update-nginx-worker-processes':
  command => "sed -i 's/worker_processes 4;/worker_processes 7;/g' /etc/nginx/nginx.conf",
  onlyif  => "grep -q 'worker_processes 4;' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin'],
} ->

exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => ['/sbin', '/usr/sbin', '/usr/bin'],
}



