#!/usr/bin/env bash

# PLUGIN_REGISTRY
# PLUGIN_REPOSITORY
# PLUGIN_REGISTRY_USER
# PLUGIN_REGISTRY_PASS

set -e

echo ""
echo "Docker buildkit setup"
echo "====================="
DOCKER_BUILDKIT=1
echo "Docker buildkit enabled!"

echo ""
echo "Building container image"
echo "========================"
# don't use cached layers and always pull never base images
docker build . \
    --tag $PLUGIN_REGISTRY/$PLUGIN_REPOSITORY \
    --no-cache \
    --pull


echo ""
echo "Performing auto login into your docker registry..."
echo "=================================================="
echo $PLUGIN_REGISTRY_PASS | docker login \
    --username $PLUGIN_REGISTRY_USER \
    --password-stdin \
    $PLUGIN_REGISTRY

echo ""
echo "Pushing the image to your registry..."
echo "====================================="
docker push $PLUGIN_REGISTRY/$PLUGIN_REPOSITORY

echo ""
echo "Build and Push finished successfully!"
echo "========="
