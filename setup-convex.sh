#!/bin/bash

# this will fail because the clerk jwt env var is not set
npx convex dev --once --configure=new --team=vly --project=$(head -c 10 /dev/urandom | xxd -p | head -c 10) || true

# set the env var
npx convex env set CLERK_JWT_ISSUER_DOMAIN https://charmed-ghost-86.clerk.accounts.dev

npx convex env set SITE_URL http://localhost:3000

# this should not fail
npx convex dev --once