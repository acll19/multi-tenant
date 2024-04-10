# Install CLI (with asdf)
asdf plugin-add flux2 https://github.com/tablexi/asdf-flux2.git
asdf install flux2 latest

# Install Flux (local development)
# You must have access to a K8s cluster to use this
flux install

# Setup GitRepository credentials (SSH)
flux create secret git multi-tenant-auth \
    --url=ssh://git@github.com/acll19/multi-tenant.git \
    --private-key-file="$HOME/.ssh/id_ed25519"

# Create GitRepository
kubectl apply -f ./setup/git_repo.yaml

# Install Crossplane CLI
curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh" | sh
sudo mv crossplane /usr/local/bin

# Install Crossplane
# https://docs.crossplane.io/latest/software/install/
helm upgrade --install crossplane \
    --namespace crossplane-system \
    --version 1.15.1 \
    --create-namespace crossplane-stable/crossplane


# Install Capsule
# https://capsule.clastix.io/docs/general/getting-started#installation
helm upgrade --install capsule oci://ghcr.io/projectcapsule/charts/capsule \
    --namespace capsule-system \
    --version 0.4.6 \
    --set manager.image.tag=v0.6.2 \
    --create-namespace


