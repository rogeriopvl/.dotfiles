# this script sets up git commit signing using SSH keys

touch $HOME/.ssh/allowed_signers

# Declaring the `git` namespace helps prevent cross-protocol attacks.
echo "$(git config --get user.email) namespaces=\"git\" $(cat ~/.ssh/id_ed25519.pub)" >> ~/.ssh/allowed_signers
