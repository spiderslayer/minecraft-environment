#
# Minecraft environment for managing a server.
#
# This environment may be tested locally using Vagrant,
# or may be deployed to a remote server.  See the README.md file.
#
group { "puppet":
  ensure => "present",
}
File { owner => 0, group => 0, mode => 0644 }

exec { "apt-update":
    command => "/usr/bin/apt-get update",
}

Exec["apt-update"] -> Package <| |>

# Instantiate the 'minecraft' class to do our basic server setup
class { 'minecraft': }

# Declare the operator (or operators)
minecraft::op { "byron358": }
minecraft::op { "ultimatetide": }
# List the whitelisted players
minecraft::whitelist { "flaryo": }
minecraft::whitelist { "Riley_Johnson": }
minecraft::whitelist { "ty2tori": }
minecraft::whitelist { "giobovo0700": }
minecraft::whitelist { "Garbanzo_Bean": }
minecraft::whitelist { "WWE_FAN_BRUNO": }
minecraft::whitelist { "hitzcreepers": }
# Define any server properties (e.g. message of the day)
# desired for the Minecraft server
minecraft::server_prop { 'motd': value => "Welcome to Byron's Minecraft Server",
}
minecraft::server_prop { 'enable-command-block': value => 'true'}
minecraft::server_prop { 'max-players':value => '9'}
minecraft::server_prop { 'pvp':  value => 'false'}
minecraft::server_prop { 'white-list':value => 'true'}


# This message of the day file is seen when ssh-ing
# in to the Minecraft server.
file { '/etc/motd':
  content => "Welcome to the Minecraft Server shell.\n"
}
