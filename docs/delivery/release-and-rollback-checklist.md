# Release and rollback checklist

## Pre-release
- Approved scope and change record.
- Requirements-to-tests traceability complete for release scope.
- Build identity and dependency provenance recorded.
- Unit, integration, contract, E2E and relevant security/privacy/accessibility/resilience tests passed.
- Open defects reviewed; no prohibited unresolved critical/high-risk defect.
- Data migration reviewed, tested on disposable environment and independently accepted; explicit authorisation recorded.
- Secrets/configuration, access, logging and alerting reviewed.
- Backup/restore and rollback/recovery rehearsed.
- Operational runbooks, support ownership and incident escalation ready.
- Legal, partner, provider and sponsor gates confirmed for the exact release capability.
- Release approver and independent reviewer recorded.

## Release
Deploy only the approved artefact to the approved environment. Verify health, access boundaries, critical workflows, telemetry and rollback trigger. Record actual result and any deviation.

## Rollback
Prefer tested backward-compatible rollback or forward-fix where data changes make rollback unsafe. Stop affected workflows, preserve evidence, reconcile external side effects, restore only from verified backups and obtain approval before destructive recovery. Do not reverse external payment/shipment actions through a database rollback.

## Current programme restriction
This checklist does not authorise production deployment or live business operations. EVI-21, Level 1 defects and migration holds remain unchanged.
