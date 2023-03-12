#!/usr/bin/env bash
set -eux
pushd ~/setup
nix build --show-trace .#nixosConfigurations.iso.config.system.build.isoImage
popd
