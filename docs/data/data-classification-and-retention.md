# Data classification, minimisation and retention design

## Classification dimensions
Classify data by confidentiality, integrity, availability, legal/contractual sensitivity and operational criticality. At minimum distinguish:
- Public catalogue information approved for publication.
- Organisation and member personal data.
- Commercially confidential buyer/supplier terms and quotations.
- Evidence and qualification documents.
- Transaction, inventory and shipment records.
- Payment-status references and reconciliation evidence.
- Security logs, access records and incident evidence.
- Synthetic fixtures and test artefacts.

## Controls
Collect only what is necessary for a defined purpose. Record purpose, lawful basis/authority to be confirmed by qualified review, data owner, access roles, retention trigger, retention period and disposal method. Apply least privilege, encryption in transit/at rest where supported, secure file handling, audit access and controlled exports.

## Retention
Do not invent statutory retention periods. Establish a schedule only after Kenyan and destination-market legal review, contractual requirements and operational needs are assessed. Preserve legal holds and evidence required for disputes or audits. Delete or anonymise only under an approved schedule with auditable disposition.

## Test data
Use synthetic data by default. Do not copy real personal, buyer, producer, financial or identity data into fixtures, screenshots, logs, issue reports or public repository history. Any exceptional use of authorised sample data requires documented scope, minimisation, access and deletion controls.


## EVI-29 operationalization — 21 November 2026

The classification and retention principles above are now mapped to the EVI-29 recovery/retention readiness assessment at `../operations/evi-29-recovery-retention-restore-readiness-assessment-001.md`. This does not create retention periods or recovery objectives. Those require qualified legal/data-protection review and an authorized business-impact decision. No backup capability or restore result is claimed.
