# Environment and promotion model

## Environment separation
Use distinct local development, automated test, integration/staging and production environments only when the approved architecture and AADDG controls define them. Production must never be used as a test environment.

## Configuration
- Configuration is explicit, validated at startup and environment-specific.
- Secrets are injected through an approved secret manager; never committed.
- Keep non-secret configuration separate from credentials.
- Record versioned configuration changes and access.
- Restrict production access and require auditable approvals for privileged operations.
- Use synthetic fixtures in non-production by default.
- Keep storage buckets, callback endpoints, identity tenants and database projects separate by environment.

## Promotion
Promote the same identified build artefact through environments where practical; do not rebuild an untraceable variant for production. Record source commit, build identity, dependency lock, migration state, test results, approvals, rollback plan and post-deployment smoke checks.

No production environment or deployment pipeline is authorised by this document.
