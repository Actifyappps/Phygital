# Security and privacy incident response — controlled operating template

**Authority:** Implement only after the incident plan, roles and communications authority are reviewed and approved. This template is not proof that an incident-response capability is staffed or exercised.

## 1. Incident record

| Field | Record |
|---|---|
| Incident ID | |
| Detected/reported date and time/timezone | |
| Reporter / detection source | |
| Incident commander / accountable role | |
| Environment, build and affected service | |
| Severity and rationale | |
| Affected data, people, organisations and workflows | |
| Security, privacy, safety, commercial, integrity and availability impacts | |
| Evidence references and preservation location | |
| Current status and next review time | |

Never place credentials, recovery codes, full identity records or unnecessary personal data in this record.

## 2. Required response sequence

1. **Detect and report:** record source, time, affected service and initial facts. Preserve uncertainty; do not label an allegation as a confirmed breach.
2. **Triage and classify:** assess confidentiality, integrity, availability, privacy, safety, commercial and participant impacts. Assign severity and incident commander role.
3. **Contain:** where authorized, disable affected feature/endpoint/integration/listing/account; revoke sessions, credentials, devices, provider keys or tokens; isolate affected systems. Record who authorised each action and its scope.
4. **Preserve evidence:** retain relevant logs, event IDs, build/configuration, timestamps and chain-of-custody details where required. Restrict investigation access and avoid altering original evidence.
5. **Assess obligations:** involve qualified legal/data-protection reviewers to determine controller/processor duties, contractual/regulatory notification, affected-party communications and applicable deadlines. Do not invent or promise a notification deadline.
6. **Communicate:** only authorized roles communicate with participants, partners, providers, insurers, regulators or authorities. Record audience, content, approval, timing and delivery.
7. **Eradicate and recover:** correct root cause, rotate exposed secrets, patch/reconfigure, restore from verified backups if needed, reconcile affected records and test the corrected boundary.
8. **Reopen safely:** require integrity validation, security/operational review and authorized reopening decision. A restored service is not automatically safe to reopen.
9. **Review and improve:** document root cause, contributing conditions, impact, corrective actions, owners, due dates, retests and updates to threat model, controls, SOPs and training.

## 3. Escalation triggers

Escalate promptly for suspected cross-tenant access, account takeover, privilege/mandate misuse, member-data disclosure, altered evidence, inventory/quantity corruption, false payment/shipment status, malicious files, provider-key compromise, offline replay, audit tampering, backup loss or production-secret exposure.

## 4. Closure record

Closure requires evidence of containment, impact assessment, required communications decisions, recovery/integrity checks, root cause, corrective actions, retests, residual risk and reviewer/authority disposition. Preserve original incident status and timeline; do not overwrite failed or uncertain findings.

## 5. Exercise and readiness evidence

Before production or real-data use, define on-call/escalation ownership, contact paths, incident severity, evidence access, provider coordination, backup restoration and tabletop/technical exercises. Retain exercise scope, participants, scenario, observed results, gaps and corrective actions.
