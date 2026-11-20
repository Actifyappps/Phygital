
# ADR-0002 — Application topology

**Status: OPEN — logical topology not selected for implementation.**  
**Governing standards:** TSBBF v1.0 and AADDG v1.0.  
**Related:** ADR-0001 technology baseline; Technical Development Manual v3.0; 024-D API contracts.

## Candidate logical shape

The Technical Development Manual v3.0 proposes a modular-monolith-first product shape: participant web surfaces, API/application service, cohesive domain modules, relational transaction store, private evidence/document storage, background workers and replaceable provider adapters. This is a candidate logical design, not an approved deployment topology.

## AADDG operating constraints

- One application should have one authoritative GitHub repository, one primary deployment and one authoritative backend by default. Additional runtimes/services require a documented reason and clear ownership.
- Web surfaces, administration, workers, PDF/QR generation, webhook consumers, migrations, tests and docs should remain in the same governed repository where applicable.
- A frontend host and worker host, if separate, must consume the same authoritative repository and follow common build, test, acceptance, release and rollback controls.
- Background workers and physical/edge bridges are first-class components with contracts, credentials, logs, retries, dead-letter handling, tests and ownership—not unofficial side scripts.
- Do not select Vercel, Cloudflare, Render, Supabase or another provider solely from an example in AADDG.

## Decision questions

1. Is a modular monolith sufficient for the pilot and expected near-term workload?
2. Which tasks require workers because of runtime/time limits (document export, QR generation, provider events, scheduled alerts)?
3. What data and file boundaries are required for privacy, evidence integrity and recovery?
4. What is the smallest number of deployable runtimes that meets reliability, security and cost requirements?
5. How are environments, configuration, secrets, monitoring, backups, rollback and worker retry coordinated?
6. What hosting terms and bandwidth limits apply to document/media traffic and intended commercial use?
7. Can the topology be reproduced from GitHub and exited/migrated without data or operational lock-in?

## Current decision

No microservice decomposition, deployment platform, worker host or backend topology is approved. Preserve the modular-monolith-first logical direction as a candidate for TSBBF/ADR review; do not create service boundaries merely to match repository folders.

## Closure evidence

Architecture diagram and data flows; component inventory; TSBBF assessments; workload/bandwidth/TCO assumptions; environment and secrets model; backup/restore and rollback plan; worker/event failure design; security/privacy review; named operational owner; approved ADR decision.
