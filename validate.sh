# validate.sh lab-1-2
#!/usr/bin/env bash
set -euo pipefail

echo "1. Verificando comprensión de capas..."
docker history alpine:3.20 --format '{{.CreatedBy}}' | head -5

echo "2. Verificando cache mount en Dockerfile..."
grep -q 'type=cache' apps/api/Dockerfile || { echo "❌ Falta cache mount"; exit 1; }

echo "3. Verificando multi-arch..."
docker buildx ls | grep -q multiarch || { echo "❌ Builder multiarch no creado"; exit 1; }

echo "✅ Checkpoint 1.2 superado"
