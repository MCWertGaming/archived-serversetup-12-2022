#!/usr/bin/env bash

set -e

/opt/tools/exporter/nvme.sh > /var/lib/prometheus/node-exporter/nvme.prom
/opt/tools/exporter/parccli.py > /var/lib/prometheus/node-exporter/parccli.prom
