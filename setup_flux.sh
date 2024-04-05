# Install CLI (with asdf)
asdf plugin-add flux2 https://github.com/tablexi/asdf-flux2.git
asdf install flux2 latest

# Install Flux (local development)
# You must have access to a K8s cluster to use this
flux install

# Setup GitRepository credentials (SSH)
flux create secret git podinfo-auth \
    --url=ssh://git@github.com/acll19/multi-tenant \
    --private-key-file=~/.ssh/id_ed25519
