#! /bin/bash

echo "Installing microk8s via snap"
sudo snap install microk8s --classic

echo "Checking the status"
sudo microk8s.status --wait-ready

echo "Turning on standard services"
sudo microk8s.enable dns dashboard registry

echo "Installing docker daemon"
sudo snap install docker
