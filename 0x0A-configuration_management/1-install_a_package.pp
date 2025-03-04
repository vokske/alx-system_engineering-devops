# Install the 'flask' package from pip3
# Ensure Python3 and pip3 packages are installed first

package { 'flask':
    ensure   => '2.1.0',
    provider => 'pip3',
}
