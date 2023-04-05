# Kills a process named killmenow

exec { 'killmenow':
  command => 'pkill killmenow',
  path => ['/usr/bin', '/bin'],
  logoutput => true,
  unless => 'pgrep killmenow',
}


