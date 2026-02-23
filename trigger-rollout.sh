#!/bin/bash
# Script to trigger a new rollout by updating the restartedAt annotation

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Update the annotation in rollout.yaml
sed -i.bak "s/restartedAt: \".*\"/restartedAt: \"$TIMESTAMP\"/" k8s/rollout.yaml

# Commit and push
git add k8s/rollout.yaml
git commit -m "Trigger rollout at $TIMESTAMP"
git push origin main

echo "✅ Rollout triggered with timestamp: $TIMESTAMP"
echo "ArgoCD will auto-sync shortly..."
