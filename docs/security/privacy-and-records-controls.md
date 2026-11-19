# Privacy, records and information-security control index

Companion to 024-F and 024-A. This is a requirements index, not a legal opinion, approved privacy notice, DPIA or security certification.

## Information classes
1. Public approved listing/profile projection.
2. Internal operational information.
3. Confidential commercial information (buyer specifications, prices, supplier terms).
4. Personal data and identity/mandate records.
5. Restricted evidence and security material (identity documents, certificates, credentials, device/security logs).

## Required controls
- Purpose limitation, minimisation, documented lawful-basis assessment, transparent notices and consent only where appropriate.
- Tenant/organisation isolation and explicit actor-capacity authorisation.
- Least privilege, separation of duties, time-bounded access, MFA for privileged roles and periodic access review.
- Encryption in transit/at rest, managed secrets, rotation, no secrets in Git, logs or client bundles.
- Secure upload/download, malware scanning, private-by-default evidence, short-lived access URLs.
- Retention schedule, legal hold, correction, export, deletion/anonymisation and backup expiry processes.
- Data-subject request and incident/breach workflow with accountable owner and deadlines validated by counsel.
- Threat modelling for offline devices, lost/stolen devices, local cache, sync conflicts, replay, QR/public links, enumeration, scraping, account takeover, malicious files, abuse and webhook spoofing.
- Audit records for privileged access, authority decisions, evidence access, data exports, moderation and case outcomes.
- Security tests: authentication, authorisation, tenant isolation, object access, input validation, rate limits, secrets, dependency/supply-chain, recovery and abuse cases.

Public QR or share links must be revocable, scope-limited and non-enumerable. Do not expose underlying private documents or personal data.
