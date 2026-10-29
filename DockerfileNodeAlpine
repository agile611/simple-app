# ===== STAGE 1: BUILDER =====
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# ===== STAGE 2: TEST (opcional) =====
FROM builder AS test
RUN npm ci
RUN npm test

# ===== STAGE 3: RUNTIME =====
FROM node:20-alpine AS runtime
WORKDIR /app
# Usuario no-root
RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001
# Copiar solo artefactos de producción
COPY --from=builder --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nodejs:nodejs /app/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /app/package.json ./
USER nodejs
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/healthz', r => {if(r.statusCode!==200) process.exit(1)})"
CMD ["node", "dist/server.js"]