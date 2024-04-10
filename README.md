### Setup

This `setup_flux.sh` script requires [asdf](https://asdf-vm.com/), kubectl, curl and helm to be installed in your system. Additionally you also need to generate an SSH key named `id_ed25519` in `$HOME/.ssh` directory. Take a look in the setup file for more details.

```bash
chmod +x ./setup_flux.sh
./setup_flux.sh
```

### Apply Flux kustomizations

```bash
kubectl apply -f ./gitops/kustomizations/
```