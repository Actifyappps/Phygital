# 024-F threat and abuse register — working baseline

**Source:** 024-F v0.1, 19 November 2026.  
**Status:** Initial threat register for review; not exhaustive and not a completed risk assessment. Likelihood, impact and residual risk must be reassessed against the selected architecture, actual workflows, providers and pilot evidence.

| ID | Threat / abuse case | Primary impact | Control direction | Initial priority |
|---|---|---|---|---|
| TH-01 | Credential theft, phishing, credential stuffing or account takeover | Unauthorized actions, disclosure, impersonation | MFA for privileged/high-impact roles, rate limits, recovery hardening, session revocation and anomaly alerts | P0/P1 |
| TH-02 | Cross-tenant/object-level access flaw | Another organisation's data disclosed or altered | Default-deny, tenant isolation, RLS/service checks, API/file/export negative tests | P0 |
| TH-03 | Forged/expired organisation mandate or seller/exporter impersonation | Invalid commercial commitment/export representation | Separate authority records, source checks, effective dates, independent review, no fallback, expiry/revocation enforcement | P0 |
| TH-04 | Cooperative representative discloses member data without authority | Privacy harm and trust loss | Separate representation and disclosure authority, minimisation, purpose-bound sharing, aggregate default | P0 before member data |
| TH-05 | Fabricated, altered or misrepresented evidence/certificate | Buyer deception, unsafe/non-conforming product, legal exposure | E1–E4 provenance, issuer/scope checks, review history, quarantine and appeal | P0 |
| TH-06 | Listing manipulation, duplicate supply or false availability | Overselling and buyer loss | Seller authority, batch backing, compatibility, quantity invariants, double-count prevention and stale-listing holds | P0 |
| TH-07 | Quantity/measurement manipulation or instrument tampering | Disputes and incorrect commercial commitments | Method/unit/precision/calibration metadata, independent checks where required, reconciliation and anomaly review | P0 |
| TH-08 | Allocation race, replay or duplicate command | Oversubscription or false reservation | Atomic server-side constraints, idempotency, concurrency tests, audit and reversal lineage | P0 |
| TH-09 | Hub operator/insider creates false custody, release or dispatch record | False physical-control assertion and liability | Service-only UI/API model, deny custody semantics, separation of duties, audit and escalation | P0 |
| TH-10 | Quote, price, terms or order-line tampering | Unauthorized commercial commitment | Seller authority, versioned immutable terms, one accepted quote/order, acceptance evidence | P0 |
| TH-11 | Payment spoofing by screenshot, redirect, email or forged webhook | False paid status and financial loss | Provider-authenticated event verification, replay protection, reconciliation, no client-side confirmation | P0 before integration |
| TH-12 | Shipment/export-status spoofing | False assurance and premature buyer reliance | Authorized source, evidence-linked milestone, provider verification and correction history | P0 before shipment workflow |
| TH-13 | Lost device, offline queue theft or replay | Personal-data exposure or unauthorized action | Encryption, minimal cache, device revocation, expiry, idempotency and sync revalidation | P1 before real offline data |
| TH-14 | Malicious upload, malware, archive bomb or unsafe preview | Account/service compromise or data exfiltration | File allow-list, signature validation, quarantine, scanning, safe storage/preview and size limits | P0 before uploads |
| TH-15 | Insider privilege misuse or support impersonation | Data theft, unauthorized change or evidence manipulation | Least privilege, named accounts, approval separation, privileged logging and periodic review | P0 |
| TH-16 | Abuse reports, appeals or complaints manipulated to silence participants | Unfair restriction, retaliation and loss of trust | Human review, reasoned decisions, separation of roles, appeal and anti-retaliation controls | P1 |
| TH-17 | Automated scraping, enumeration, spam or denial of service | Availability loss or commercial intelligence leakage | Rate limits, bot controls, safe public projections, pagination limits, monitoring and response | P1 |
| TH-18 | Dependency, build pipeline, secret or deployment compromise | System-wide compromise | Protected branches, dependency/secret scanning, reproducible builds, restricted deployment and rollback | P0 before production |
| TH-19 | Backup compromise, deletion or failed restoration | Confidentiality loss or prolonged outage | Encryption, access separation, monitoring, restore tests, retention and incident runbooks | P1 before production |
| TH-20 | Cross-environment or test-data contamination | Real data exposure or synthetic records mistaken as real | Environment separation, synthetic-only baseline, access restrictions, data reset and release checks | P0 |

## Risk treatment record

For each threat retain: asset, trust boundary, actor/source, scenario, vulnerability, likelihood, impact, inherent rating, existing controls, residual rating, treatment, owner role, evidence, review date and acceptance authority.

P0/P1 labels are provisional control priorities, not final risk ratings and not permission to defer a mandatory gate. Link threats to SEC-001–SEC-020, ST-01–ST-24, relevant QAT cases, defects and evidence. Reassess after material architecture, workflow, provider or pilot-scope changes.
