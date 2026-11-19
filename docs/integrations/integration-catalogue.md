# Provider-neutral integration catalogue

No provider, government endpoint, commercial partner or integration is assumed available or contracted. Each integration remains a candidate until the responsible organisation, legal authority, technical access, service levels, data-processing terms and acceptance tests are evidenced.

| Capability | Logical purpose | Key controls | Activation gate |
|---|---|---|---|
| Identity / authentication | Human and service identity | MFA where appropriate, token lifecycle, scoped service identity, revocation | Approved identity architecture and security review |
| Notifications | Email/SMS/in-app notices | Consent/purpose, delivery status, retry, suppression and privacy | Provider and message policy approved |
| Measurement devices | Capture measurement readings | Device identity, calibration, units, tamper/quality flags, raw reading retention | Hub workflow and device accuracy validated |
| Laboratory / inspection | Receive results and certificates | Issuer competence, scope, authenticity, expiry, evidence class | Qualified provider and buyer/destination requirement |
| Logistics / carrier | Record collection and shipment milestones | Carrier identity, event provenance, tracking references, exceptions | Contract, route and operational workflow approved |
| Payment / banking | Record instructions and payment status | Buyer-to-seller direct flow, provider references, signature verification, reconciliation | Licensed provider, legal review, contract and sandbox tests |
| Export / regulatory documents | Track required documents and status | Jurisdiction/product-specific rules, issuer and validity | Competent authority/qualified adviser confirmation |
| Document storage/scanning | Store and inspect uploads | Malware scanning, type/size limits, access and retention | Security and privacy approval |
| Analytics / forecasting | Descriptive metrics then possible forecasts | Data quality, lawful purpose, bias/uncertainty, no false precision | Sufficient pilot data and separate gate |

## Adapter rules
Provider SDKs must remain outside domain modules. Adapters map provider-specific states into internal contracts, preserve original provider references, verify callback authenticity, implement idempotency and record failures for reconciliation. Sandbox success is not production approval.
