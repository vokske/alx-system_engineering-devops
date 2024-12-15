# Use exec to kill a process
# Hint - provide the ful path of the pkill command in the command attribute.

exec { 'killmenow':
    command => '/usr/bin/pkill -f killmenow',
    cwd     => '/home/voks/alx-system_engineering-devops/0x0A-configuration_management',
}