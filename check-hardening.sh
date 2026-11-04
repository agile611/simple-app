#!/usr/bin/env bash
# check-hardening.sh
IMAGE=$1

echo "=== Hardening Check para $IMAGE ==="

USER=$(docker image inspect $IMAGE --format '{{.Config.User}}')
echo "User: $USER"
[[ "$USER" != "" && "$USER" != "root" && "$USER" != "0" ]] && echo "✅ Non-root" || echo "❌ Root"

# Runtime checks (requiere run)
CID=$(docker run -d --read-only --cap-drop=ALL --security-opt seccomp=seccomp-profile.json $IMAGE sleep 30)
sleep 2

READONLY=$(docker inspect $CID --format '{{.HostConfig.ReadonlyRootfs}}')
echo "ReadOnly: $READONLY"
[[ "$READONLY" == "true" ]] && echo "✅ Read-only" || echo "❌ Not read-only"

CAPDROP=$(docker inspect $CID --format '{{.HostConfig.CapDrop}}')
echo "CapDrop: $CAPDROP"
[[ "$CAPDROP" == "[ALL]" ]] && echo "✅ Cap drop ALL" || echo "❌ Cap drop incomplete"

SECCOMP=$(docker inspect $CID --format '{{.HostConfig.SecurityOpt}}')
echo "SecurityOpt: $SECCOMP"
echo "$SECCOMP" | grep -q seccomp && echo "✅ Seccomp" || echo "❌ No seccomp"

docker rm -f $CID >/dev/null
