file { '~/.ssh':
  ensure => directory,
  mode   => '0700',
  owner  => $ENV['USER'],
  group  => $ENV['USER'],
}

file { '~/.ssh/config':
  ensure => present,
  mode   => '0600',
  owner  => $ENV['USER'],
  group  => $ENV['USER'],
}

file_line { 'Declare identity file':
  path  => '~/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '~/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication',
}

file_line { 'Add Host block':
  path  => '~/.ssh/config',
  line  => 'Host *',
  match => '^Host \*',
}

