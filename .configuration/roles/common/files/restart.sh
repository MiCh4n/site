#!/usr/bin/env bash
set -e
nomad job status internals | grep -A 10 "Allocations" | awk '{if($3=="backend" && $5=="run") {print $1}}' | xargs -I{} nomad alloc restart {} nginx
