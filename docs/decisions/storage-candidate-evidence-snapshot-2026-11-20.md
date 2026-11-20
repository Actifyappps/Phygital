# TC-06 private object and document storage — initial provider evidence snapshot

**Evidence date:** 20 November 2026  
**Assessment status:** Initial public-source evidence captured; NOT A SCORECARD, shortlist or selection.  
**Currency:** USD public list prices as displayed on source pages on the evidence date. Taxes, operations, retrieval, egress, backups, malware scanning, support and workload costs are not normalized.

## 1. Purpose and security boundary

This is the first provider-specific evidence record under WP-03 for TC-06. It compares:
1. Supabase Storage, integrated with Supabase Auth/PostgreSQL RLS.
2. Cloudflare R2, S3-compatible object storage with jurisdiction/location controls.
3. Amazon S3, managed object storage with versioning, lifecycle, replication and Object Lock.

The storage service is not the Phygital evidence authority. The application must own document metadata, tenant/resource scope, evidence class, issuer/source, acquisition type, hash, validity, review status, retention, supersession/revocation and access audit. A cryptographic hash proves file integrity relative to a recorded value; it does not prove issuer identity, measurement truth or regulatory certification.

All private objects must be private by default. A file URL, object key or possession of a signed link is not an authorization decision.

## 2. Governing requirements

Assess against TC-06, TDR-01, TDR-08, TDR-09, TDR-13, TDR-16 and source requirements from 024-C, 024-D, 024-F and 024-G:
- private-by-default storage and server-side object authorization;
- tenant/resource/transaction scoping for upload, view, download, replacement, deletion and export;
- short-lived, narrowly scoped upload/download grants;
- safe content/type/size validation, quarantine and malware inspection;
- object integrity hash, provenance and controlled version/supersession;
- retention, deletion, legal hold and immutable evidence handling where justified;
- backup/restore of objects plus metadata and relationships;
- access logging, incident response and least-privilege service credentials;
- complete export and independent exit.

## 3. Public-source evidence snapshot

### 3.1 Supabase Storage

**Product shape**
- Supabase Storage is integrated with the Supabase project, PostgreSQL and RLS. It exposes REST and S3-compatible interfaces, supports resumable uploads (TUS), CDN delivery and image transformations.
- Buckets are private by default. Private bucket downloads are subject to RLS on storage.objects; access can be granted through an authenticated request or time-limited signed URL.
- Public buckets bypass access controls for retrieval. They must never be used for private trade evidence, identity documents, contracts, inspection results or other restricted files.

**Public price/allowances observed**
- Pro includes 100 GB file storage, then **$0.0213/GB-month**.
- Pro includes 250 GB cached egress, then published overage charges; uncached egress and image transformations have separate pricing.
- Pro max upload size can be configured up to 500 GB; per-bucket limits should be lower and type-restricted according to actual use.
- Free includes 1 GB and a 50 MB maximum file size; this is not an equivalent production baseline.

**Security and recovery caveats**
- Private bucket access is enforced by RLS. By default, Storage does not allow uploads without applicable RLS policies.
- Supabase signed URLs are bearer links. The documentation states an individual signed URL cannot be revoked directly; moving, renaming or deleting the object can invalidate that object link, and rotating the URL signing key revokes all links signed with the prior key.
- Supabase database backups include Storage object metadata, not the object blobs. Object data requires its own backup/export/recovery procedure.
- The project region hosts primary Storage objects, but broader project data residency and subprocessors require review under the database snapshot. CDN delivery and support/telemetry may involve processing outside the primary region.

**Initial assessment observations**
- Strength: simple integration with project identity, Postgres metadata and RLS; private bucket default and resumable uploads.
- Risk/unknown: platform coupling, signed URL revocation limitations, object backup separation, egress costs, storage access audit detail and export/restore independence.
- Required test: confirm private bucket RLS across direct URLs, signed links, upload paths and service roles; restore objects and metadata separately and reconcile exact hashes/ownership.

Official sources:
- [Supabase Storage overview](https://supabase.com/docs/guides/storage)
- [Supabase bucket access model](https://supabase.com/docs/guides/storage/buckets/fundamentals)
- [Supabase Storage access control](https://supabase.com/docs/guides/storage/security/access-control)
- [Supabase serving private assets and signed URLs](https://supabase.com/docs/guides/storage/serving/downloads)
- [Supabase URL signing keys and revocation](https://supabase.com/docs/guides/storage/security/signing-keys)
- [Supabase upload limits](https://supabase.com/docs/guides/storage/uploads/file-limits)
- [Supabase Storage pricing](https://supabase.com/docs/guides/storage/pricing)
- [Supabase database backups](https://supabase.com/docs/guides/platform/backups)

### 3.2 Cloudflare R2

**Product shape**
- R2 is S3-compatible object storage with Standard and Infrequent Access storage classes. It offers presigned URLs, API tokens, lifecycle controls, CORS and integration with Cloudflare Workers.
- R2 does not impose internet egress bandwidth charges for its storage classes. This can be attractive where buyers and producers download large files, but storage, request, retrieval, logs and other platform costs remain.
- R2 offers bucket location hints and jurisdictional restrictions, but these are not equivalent:
  - APAC is an available location hint, but location hints are best-effort, not a guarantee.
  - Jurisdictional Restrictions guarantee storage/processing within the selected jurisdiction; current options listed are EU, US and FedRAMP, not Kenya or a general APAC jurisdiction.
  - Bucket jurisdiction cannot be changed after creation.

**Public price/allowances observed**
- Standard storage: **$0.015/GB-month**.
- Standard Class A operations: **$4.50 per million requests**; Class B: **$0.36 per million requests**.
- Monthly free allowance: 10 GB-month Standard storage, 1 million Class A operations and 10 million Class B operations.
- Standard internet egress: free.
- Infrequent Access: $0.01/GB-month, $9/million Class A, $0.90/million Class B, and $0.01/GB data retrieval; no free-tier allowance for this class.
- Cloudflare rounds usage to billing units; small volumes can round up.

**Security, audit and immutability caveats**
- R2 encrypts objects and metadata at rest with AES-256; transport uses TLS. Encryption keys are managed by Cloudflare.
- Presigned URLs can authorize one object operation and expire from 1 second to 7 days. They are bearer tokens and can be reused until expiry. R2 supports GET, HEAD, PUT and DELETE presigned URLs; HTML-form POST multipart presigning is not supported.
- R2 API tokens can be scoped to account or bucket resources and permissions; token creation requires purchasing R2.
- Cloudflare account audit logs capture bucket/configuration changes but do not include GetObject/PutObject data-access operations. R2 Data Access Logs can record supported object operations, but delivery is asynchronous/best-effort, may be delayed or omitted, excludes HTTP status 400+, and has seven-day retention. They must not be treated as a complete immutable business evidence audit.
- R2 release notes state S3 Object Lock is not supported. Do not assume S3 compatibility includes S3 Object Lock or WORM retention.
- Data location hints and jurisdiction limitations are material for Kenyan/cross-border data-processing review.

**Initial assessment observations**
- Strength: no egress fees, low published Standard storage price, S3 compatibility, APAC location hint and scoped presigned access.
- Risk/unknown: APAC hint is not a residency guarantee; no Object Lock; signed URLs are bearer credentials; data-access logs are not complete; provider-managed encryption keys; and separate application-level immutability/backup is required.
- Required test: confirm bucket placement and jurisdiction, token scope, CORS, signed URL expiry, object hash, lifecycle behaviour, audit coverage and independent export/restore.

Official sources:
- [Cloudflare R2 pricing](https://developers.cloudflare.com/r2/pricing/)
- [R2 data location and jurisdictional restrictions](https://developers.cloudflare.com/r2/reference/data-location/)
- [R2 data security](https://developers.cloudflare.com/r2/reference/data-security/)
- [R2 presigned URLs](https://developers.cloudflare.com/r2/api/s3/presigned-urls/)
- [R2 API tokens](https://developers.cloudflare.com/r2/api/tokens/)
- [R2 audit logs](https://developers.cloudflare.com/r2/platform/audit-logs/)
- [R2 data access logs](https://developers.cloudflare.com/r2/buckets/data-access-logs/)
- [R2 release notes](https://developers.cloudflare.com/r2/platform/release-notes/)

### 3.3 Amazon S3

**Product shape**
- Amazon S3 is managed object storage with regional buckets, multiple storage classes, lifecycle rules, versioning, replication, access policies, encryption and integrations with AWS IAM/KMS/Backup.
- S3 is a broad infrastructure component rather than a fully managed application document service. Phygital must build the application authorization, metadata, quarantine, review and user-facing document workflows around it.
- AWS lists multiple regions, including Cape Town (af-south-1) and Singapore (ap-southeast-1). The selected region, data transfer, support access and subprocessors must be confirmed in the exact account/contract.

**Public price model**
- S3 has no minimum charge; costs depend on storage class and region, requests, data retrieval, data transfer, lifecycle transitions, replication, management and other features.
- Official pricing page states the first 100 GB/month of internet data transfer out is free across AWS services/regions (with stated exceptions); beyond that, transfer and acceleration rates apply.
- Storage price differs by region. An official calculator estimate is required for the selected region (e.g., Cape Town or Singapore) and workload; no single global per-GB price is used in this record.
- GET requests and PUT/COPY/POST/LIST requests have separate per-request charges. Versioning, replication and backups can multiply stored object volume and request costs.

**Security and evidence controls**
- New S3 buckets have Block Public Access enabled by default and Bucket Owner Enforced object ownership, disabling ACLs. Account-level Block Public Access can apply globally.
- Presigned URLs provide time-limited access without changing bucket policy. SDK/CLI can create URLs up to 7 days, but temporary credentials may cause earlier expiry. URLs are bearer tokens and can be reused until expiry.
- S3 Versioning retains multiple object versions and permits recovery after overwrite/delete.
- S3 Object Lock provides WORM retention, governance/compliance modes and legal holds, but requires Versioning. Compliance mode prevents deletion/overwrite of a protected object version even by root; this is powerful and potentially irreversible for the retention period.
- AWS Backup, versioning and replication can provide recovery options; each has separate configuration, retention, region and cost implications.
- Object Lock is a storage-level protection, not a substitute for Phygital's append-only evidence metadata, authorization, correction/supersession and audit workflow.

**Initial assessment observations**
- Strength: mature IAM and bucket policy controls, default public-access blocking, versioning, Object Lock/legal hold, broad region choices and a comprehensive backup/replication ecosystem.
- Risk/unknown: greater IAM/configuration complexity, request/egress/replication costs, additional AWS operating knowledge, and the need to integrate malware scanning and Phygital authorization/metadata.
- Required test: least-privilege IAM, Block Public Access, KMS policy, presigned link scope/expiry, versioning, Object Lock retention/legal hold, lifecycle/restore, cross-region exit and independent audit reconciliation.

Official sources:
- [Amazon S3 pricing](https://aws.amazon.com/s3/pricing/)
- [Amazon S3 FAQs and regional availability](https://aws.amazon.com/s3/faqs/)
- [Block public access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
- [Presigned URL usage and expiration](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-presigned-url.html)
- [S3 Versioning](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html)
- [S3 Object Lock overview](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html)
- [Configure Object Lock and legal holds](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock-configure.html)
- [S3 backup and recovery](https://docs.aws.amazon.com/AmazonS3/latest/userguide/backup-for-s3.html)

## 4. Initial comparison — facts, not scores

| Dimension | Supabase Storage | Cloudflare R2 | Amazon S3 |
|---|---|---|---|
| Core model | Managed object storage integrated with Auth/Postgres/RLS | S3-compatible object storage with egress-free standard class | Managed regional object storage and broad AWS controls |
| Public paid storage reference | 100 GB Pro included; then $0.0213/GB-month | $0.015/GB-month Standard | Region/storage-class-specific; use AWS Calculator |
| Egress | Included quota then paid overage | Internet egress free | Transfer pricing applies; first 100 GB/month free across eligible AWS services |
| Private access | Private buckets with Storage RLS | API tokens, bucket controls, presigned URLs | IAM/bucket/access-point policies, presigned URLs |
| Signed link revocation | Individual URL not directly revocable; move/delete object or rotate all signing key | Bearer URL until expiry; credential/key controls | Bearer URL until expiry/credential expiry or revocation |
| Data location | Project region; broader processing caveats | APAC hint best-effort; hard jurisdiction choices EU/US/FedRAMP | Select AWS region including Cape Town/Singapore |
| Versioning / WORM | No S3 Object Lock equivalent evidenced in this snapshot | S3 Object Lock not supported | Versioning + Object Lock governance/compliance/legal hold |
| Access audit | App/database policy integration; object access logging must be verified | Audit config logs; object data logs best-effort, 7 days | CloudTrail data events/logging options; configure and price separately |
| Main trade-off | Integrated authorization vs bundle/recovery coupling | Egress economics vs residency/immutability/audit limits | Strong retention controls vs complexity and full-service cost |

No candidate is scored or recommended. The storage price alone is not comparable: malware scanning, request count, egress, replication, versioning, legal hold, backup, data location, support and operator effort can dominate.

## 5. Mandatory Phygital design rules

Regardless of provider:
1. Keep all trade, identity, KYC, contract, inspection, laboratory and restricted evidence in private storage.
2. Use a server-issued opaque object ID mapped to a metadata record; do not use a predictable object path as access control.
3. The application authorizes every upload/download/delete/share action against current identity, organisation, resource, purpose and mandate.
4. Generate short-lived, operation-scoped links only after authorization; use minimal expiry and never log full signed URLs.
5. Treat links as bearer secrets. Individual URL revocation limitations must be compensated by short expiry, object move/version, credential/key rotation and application-level deny checks.
6. Preserve every submitted file version and hash; replacement creates a new version/evidence record and never silently overwrites the source.
7. Quarantine uploads until type/content validation and malware scanning complete; scanner outage fails closed.
8. Record access and lifecycle events in Phygital's own append-only audit trail; provider access logs are supplemental.
9. Store public QR projections separately from private evidence; never place private object URLs or sensitive metadata in a public projection.
10. Use storage-level WORM/legal hold only when approved retention/legal rules require it; define correction, supersession, retention and disposal before enabling irreversible settings.

## 6. Evidence gaps before scoring

### 6.1 Legal, privacy and location
- Obtain current DPA, subprocessor, incident, deletion and data transfer terms for the exact plans/accounts.
- Confirm data location, replication, CDN/cache, support access and telemetry processing.
- Determine whether APAC location hint is sufficient for Cloudflare's actual data processing; it is not a residency guarantee.
- Determine whether AWS Cape Town or Singapore is preferred after legal review and measured latency.
- Confirm whether any legal retention requirement actually requires WORM/Legal Hold; do not apply it by default.

### 6.2 Technical and security
- Test private object access through every API/SDK/direct URL path, including signed upload and download.
- Verify object key/path isolation and metadata tamper controls.
- Verify URL expiry, reuse, revocation/rotation and CDN cache behaviour.
- Test resumable upload, checksum validation, content sniffing, malware quarantine and scanner failure.
- Demonstrate object version/supersession and evidence hash reconciliation.
- Test provider backup/restore and independent export of all objects and metadata.
- Confirm audit log completeness, retention, delivery guarantees and export.
- Verify least-privilege storage credentials, key rotation, KMS/Cloudflare key model and incident response.

### 6.3 Commercial/TCO
- Validate expected file counts, average/max size, upload/download frequency, retention, image/video use, backup copies, request counts and global buyer distribution.
- Compare low/base/high storage, PUT/GET/LIST, egress, retrieval, replication, scanning, CDN and backup costs.
- Include implementation, monitoring, support, security and exit labour.
- Do not assume no-egress means zero delivery or processing cost.

## 7. Candidate disposition

- Supabase Storage: **EVIDENCE STARTED — NOT SCORABLE**.
- Cloudflare R2: **EVIDENCE STARTED — NOT SCORABLE**.
- Amazon S3: **EVIDENCE STARTED — NOT SCORABLE**.

No object-storage provider is shortlisted or approved. TSBBF numeric scores remain blank.

## 8. Next actions

1. Resolve whether legal/operational requirements need object-level WORM retention or only append-only application evidence records.
2. Obtain current DPAs/subprocessor/region evidence and confirm Kenya/cross-border transfer suitability.
3. Add separate TC-06 workbook candidate records and exact price/usage assumptions, leaving scores blank.
4. Define a synthetic private-document test pack covering cross-tenant access, signed URL, malware, restore and audit.
5. Only after approval, run a synthetic object-storage spike and independently review the evidence.

**No storage provider procurement, bucket creation, production document upload, real-data processing or live evidence handling is authorised by this snapshot.**
