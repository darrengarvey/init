Simple repo to set up an environment on any distro.

I guess I could use nixos or chef or puppet or packer instead, but this
works on several different distros and is dead simple... I tend to flip
between them (Fedora, Debian, Ubuntu, Mint) quite regularly), trying to
find the right one.

Just run:

./setup-machine.sh

ensuring that you're running as the user you want to be. Only $HOME
is assumed to be set. Running the above should be re-entrant.

