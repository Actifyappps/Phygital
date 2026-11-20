# P1 platform-quality evidence pack — queues, observability, malware inspection and developer tooling

**Evidence date:** 20 November 2026  
**Scope:** TC-08 queue/scheduler/event delivery; TC-11 observability/incident telemetry; TC-22 malware/file inspection; TC-23 developer/dependency tooling.  
**Status:** Initial source-derived and public-source evidence only. No product is scored, shortlisted, selected, provisioned or tested.

## 1. Purpose and authority

These components are P1 in the technology component register: required for a complete pilot architecture decision, but not a reason to introduce premature infrastructure before the core P0 architecture and operating assumptions are validated.

Governing sources include Technical Development Manual v3.0, AADDG v1.0, TSBBF v1.0, 024-D, 024-F and 024-G. Provider documentation is evidence input, not implementation approval.

## 2. TC-08 — Queue, scheduler and event delivery

### 2.1 Candidate patterns

| Pattern | Fit | Key controls and unresolved evidence |
|---|---|---|
| PostgreSQL transactional outbox / database-backed job pattern | Preferred baseline to assess with a single transactional database | Atomic business-state + outbox write; row locking/lease; idempotency; retry; poison-job quarantine; polling load; retention; restore and replay |
| Supabase Queues (pgmq) | Postgres-native queue option if Supabase database is selected | Public Alpha maturity; visibility timeout; queue archival; role/RLS; same database failure/capacity domain; consumer runtime still required |
| Cloudflare Queues + Workers | Managed queue/consumer option for a Workers-based runtime | At-least-once effects; 128 KB messages; retry/retention/DLQ limits; transactional outbox needed across Postgres/Cloudflare |
| Render worker + Key Value/BullMQ or Workflows | Conventional Node worker/managed workflow option | Worker and queue are separate components; workspace/compute/network costs; Workflow maturity/retention/region and exit evidence |

The detailed current public-source facts and limitations for these queue patterns are already recorded in [the TC-01/02/07 frontend, runtime and worker evidence snapshot](../decisions/frontend-runtime-worker-candidate-evidence-snapshot-2026-11-20.md). This P1 record does not repeat or override it.

### 2.2 Event delivery rules

- Domain state change and outbox/event intent must commit atomically, or a documented reconciliation mechanism must detect/fix the gap.
- Event identity is provider-scoped where external, with unique idempotency keys and payload hash.
- Distinguish delivery attempt, accepted event, business transition and external side effect.
- Use bounded retries/backoff, DLQ/quarantine, replay controls and operator-visible terminal failure.
- Do not assume exactly-once message delivery or exactly-once external side effects.
- Replay requires authorization, reason, correlation and retained attempt history.
- Consumer rechecks current mandate, resource state, transaction status and programme gate.
- Queue messages carry identifiers/correlation and minimum data; do not place private documents, secrets or sensitive personal data in messages.
- Scheduler timezone, missed-run, duplicate-trigger and cancellation semantics must be explicit.
- A queue is not a business audit ledger; persist source event and decision evidence in the domain/audit records.

### 2.3 Acceptance tests

1. Outbox record and business transition are atomic.
2. Duplicate delivery is idempotent.
3. Retry is bounded; poison messages quarantine without blocking unrelated work.
4. DLQ replay requires an authorized operator and preserves prior attempts.
5. Late/duplicate/out-of-order provider callbacks cannot fabricate or duplicate a business transition.
6. Revoked mandate or changed order/batch state is rechecked at execution.
7. Worker crash/restart/deploy does not lose acknowledged work.
8. Queue retention and backup/restore preserve required replay/audit evidence.
9. Scheduled jobs handle timezones, missed runs and duplicate triggers safely.
10. Operator can inspect queue age, attempt count, DLQ, terminal failures and reconciliation status.

**Status:** EVIDENCE STARTED — NOT SCORABLE. No queue/scheduler pattern is selected.

## 3. TC-11 — Observability and incident telemetry

### 3.1 Candidate approach A — OpenTelemetry instrumentation + managed Grafana Cloud

**Public-source facts**
- OpenTelemetry is vendor/tool-agnostic and supports traces, metrics, logs and baggage; it is an instrumentation/collection framework, not a telemetry backend.
- OpenTelemetry Collector can receive, process and export signals to one or more backends.
- Grafana Cloud Free is listed at $0 with limited usage and 14-day retention for metrics/logs/traces/profiles.
- Grafana Cloud Pro starts at **$19/month plus usage**; current published allowances include 10k active metric series and 50 GB log ingestion on included platform tiers, with 13-month metrics and 30-day logs/traces retention.
- Usage is metered separately by signal/product: active metric series, GB processed/written/retained, host hours and other units.

**Potential fit**
- Keep instrumentation and export portable.
- Managed backend reduces the operational burden of running metrics/logs/traces infrastructure.
- Can begin with low-volume logs, metrics and traces and grow under measured telemetry use.

**Risks**
- Data region, support access, subprocessors, DPA, retention and deletion terms need verification.
- Cost can rise through high-cardinality metrics, verbose logs, traces, long retention and host-hour products.
- Free retention is not an audit archive or a guaranteed long-term incident evidence store.
- Sensitive values must be redacted before export; a vendor's regional endpoint does not itself make data processing compliant.

Official sources:
- [OpenTelemetry signals](https://opentelemetry.io/docs/concepts/signals/)
- [OpenTelemetry overview](https://opentelemetry.io/docs/what-is-opentelemetry/)
- [OpenTelemetry Collector](https://opentelemetry.io/docs/collector/)
- [Grafana Cloud pricing](https://grafana.com/pricing/)
- [Grafana Cloud pricing and usage](https://grafana.com/docs/grafana-cloud/platform/pricing-and-usage/)

### 3.2 Candidate approach B — self-hosted Grafana OSS + Prometheus/Loki/Tempo

**Public-source facts**
- Grafana OSS can be self-hosted; Prometheus is a metrics system, Loki a log aggregation system and Tempo a tracing backend.
- Grafana, Loki and Tempo are licensed AGPLv3 (with specified exceptions for some components/directories). This must be checked against the exact deployed components and licence obligations.
- Loki stores log chunks in object storage or local filesystems; Tempo uses object storage for traces.
- Self-hosting keeps telemetry on infrastructure under the operator's control but transfers availability, scaling, security, upgrades, storage, retention and on-call responsibility to the team.

**Potential fit**
- Greater control over data location and retention.
- Avoids a managed observability SaaS dependency.
- Vendor-neutral OpenTelemetry ingestion remains possible.

**Risks**
- Requires a named operator, secure deployment, backup/restore, upgrades, capacity planning and alert maintenance.
- AGPLv3 obligations require legal/licence review.
- Self-hosting is not automatically cheaper when staff time and reliability are included.

Official sources:
- [Grafana self-hosted overview](https://grafana.com/docs/grafana/latest/introduction/)
- [Grafana licensing](https://grafana.com/licensing/)
- [Grafana Loki](https://grafana.com/oss/loki/)
- [Grafana Tempo](https://grafana.com/oss/tempo/)

### 3.3 Minimum observability contract

- Structured logs with timestamp, severity, service/module, environment, correlation/trace ID, actor/service ID where safe, resource reference and outcome.
- Metrics for availability, request latency, error rates, database connections/locks, queue age/retries, storage upload failures, sync failures and provider adapter failures.
- Traces across request → domain transaction → outbox → worker → provider adapter, without leaking tokens or payloads.
- Separate operational telemetry from append-only business audit and Evidence Register closure evidence.
- Redact secrets, authentication tokens, signed URLs, personal data, KYC, buyer-confidential information and document contents before telemetry leaves the application boundary.
- Define access roles, retention, deletion, alert routing, incident severity and evidence preservation.
- Alerts must be actionable and have an accountable response role; uptime dashboards alone do not constitute incident response.

**Status:** EVIDENCE STARTED — NOT SCORABLE. No telemetry backend, region, retention or support plan is selected.

## 4. TC-22 — Malware and file inspection

### 4.1 Candidate approach A — ClamAV in a controlled quarantine worker

**Public-source facts**
- ClamAV is an open-source GPLv2 anti-virus toolkit with a multi-threaded daemon, command-line scanner and signature database update tools.
- ClamAV documentation explicitly says it is not a traditional full endpoint security suite.
- It can be deployed near private object storage, scanning files in quarantine before a document becomes available to authorized users.

**Potential fit**
- Provider-neutral scan worker can operate with Supabase Storage, R2 or S3 by downloading a quarantined object through scoped credentials.
- File contents can remain within the chosen operating environment.
- No per-GB managed scanning vendor charge, but compute, signature updates, patching and operational ownership remain.

**Risks**
- Signature freshness, scan performance, archive bombs, encrypted files, unsupported formats and false negatives need policy.
- A “clean” scan result is not proof that a document is truthful, authentic or compliant.
- GPLv2 licence and redistribution obligations must be reviewed if the scanner is bundled/distributed.
- Scanner outage or update failure must leave files quarantined, not implicitly clean.

Official source:
- [ClamAV documentation and licence](https://docs.clamav.net/Introduction.html)

### 4.2 Candidate approach B — Amazon GuardDuty Malware Protection for S3

**Public-source facts**
- GuardDuty Malware Protection for S3 automatically scans newly uploaded objects in configured S3 buckets and emits a finding/EventBridge notification when malware is detected.
- Published Free Tier: 1,000 requests and 1 GB scanned per month per AWS account/Region.
- AWS pricing example shows $0.09 per GB scanned plus $0.215 per 1,000 objects evaluated after free allowances; actual price must be confirmed in the selected region and at current date.
- Current quotas include maximum S3 object size 100 GB and maximum 25 protected buckets per account per Region.

**Potential fit**
- Managed scanning if S3 is selected for private object storage.
- Findings can trigger quarantine/tagging workflows.
- Reduces the need to operate signature engines directly.

**Risks**
- AWS S3-specific; not a direct scan service for Supabase Storage or Cloudflare R2.
- Separate S3 API, EventBridge, IAM, quarantine and audit costs/controls apply.
- Scan limits and unsupported file formats need to be reconciled with Phygital document policy.
- Finding/notification must be mapped to a controlled Phygital document state; it must not directly approve evidence.

Official sources:
- [GuardDuty Malware Protection for S3 pricing](https://docs.aws.amazon.com/guardduty/latest/ug/pricing-malware-protection-for-s3-guardduty.html)
- [GuardDuty pricing](https://aws.amazon.com/guardduty/pricing/)
- [GuardDuty Malware Protection for S3 quotas](https://docs.aws.amazon.com/guardduty/latest/ug/malware-protection-s3-quotas-guardduty.html)

### 4.3 Mandatory file-security workflow

1. Upload goes to a private quarantine prefix/bucket.
2. Server validates size, declared type, magic bytes/content, filename and allowed format.
3. Object hash and immutable upload metadata are recorded.
4. Malware scanner receives only the scoped object and returns a versioned result.
5. Scanner unavailable, timeout, unsupported format, encrypted archive or error means QUARANTINED / NEEDS REVIEW, never clean.
6. A clean scan may permit authorized review; it does not establish evidence authenticity or verification.
7. A human/domain reviewer decides whether the evidence is acceptable.
8. Every upload, scan, quarantine, release, replacement, rejection, download and deletion is recorded in the Phygital audit trail.
9. Replacement creates a new object/evidence version; no silent overwrite.
10. Public QR projection never exposes private file links or scanner details.

**Status:** EVIDENCE STARTED — NOT SCORABLE. No scanner is selected or integrated.

## 5. TC-23 — Developer and dependency security tooling

### 5.1 Candidate approach A — GitHub-native Dependabot and Advanced Security

**Public-source facts**
- Dependabot security updates are available for all repositories where dependency graph and alerts are enabled.
- GitHub CodeQL/code scanning is available for public repositories; private repository entitlements depend on the GitHub plan and Code Security add-on.
- GitHub pricing currently lists GitHub Secret Protection at **$19 per active committer/month** and GitHub Code Security at **$30 per active committer/month**.
- GitHub Free/Team/Enterprise entitlements differ for secret scanning, push protection, CodeQL, dependency review and advanced triage. Do not infer Phygital repository entitlements from the ChatGPT plan or account context; confirm the repository owner's GitHub organization plan.

**Potential fit**
- Native alerts, PR updates, security dashboards and repository integration.
- Dependabot can raise security update PRs without adding an external dependency service.

**Risks**
- Plan/add-on cost may scale with active committers.
- Some advanced scanning and push-protection controls are plan-gated for private repositories.
- Native tooling still needs policy for triage, severity, patch windows, false positives and exceptions.

Official sources:
- [GitHub security plans](https://github.com/security/plans)
- [GitHub security features and plan availability](https://docs.github.com/en/code-security/getting-started/github-security-features)
- [Dependabot security updates](https://docs.github.com/en/code-security/concepts/supply-chain-security/dependabot-security-updates)

### 5.2 Candidate approach B — open-source scanning in CI

- Trivy is Apache-2.0 and scans repositories, filesystem, container images, IaC, vulnerabilities, misconfigurations, SBOM and licence metadata.
- Gitleaks is MIT and scans current/past Git content for secrets. Its upstream repository says it is feature-complete and future releases are security patches only as of the current project state; this is a maintenance/lifecycle risk that should be reviewed before standardizing on it.
- These tools can run in GitHub Actions and upload SARIF where supported, reducing dependency on paid platform features. They do not replace code review, branch protection, secret rotation or runtime security.

Official sources:
- [Trivy](https://trivy.dev/)
- [Trivy licence scanning](https://trivy.dev/docs/dev/scanner/license/)
- [Gitleaks repository and current maintenance notice](https://github.com/gitleaks/gitleaks)

### 5.3 Minimum developer-tooling controls

- Lockfiles and dependency manifests committed; no unpinned mutable production dependency.
- Automated vulnerability and licence scans on pull request and scheduled runs.
- Secret scanning of current source and Git history; push protection where available.
- Immediate credential revocation/rotation for any real secret found; deleting the line is insufficient.
- SBOM and build provenance retained for release artifacts where supported.
- Container/IaC scanning before deployment where containers/infrastructure-as-code are used.
- Action/plugin versions pinned; third-party CI actions reviewed and minimally permissioned.
- Vulnerability severity, exploitability, affected reachability, patch deadline, exception owner and expiry are recorded.
- Security findings and suppressions are auditable; no indefinite blanket ignore rules.
- Tool outputs are reviewed; scanner pass does not equal independent security acceptance.

**Status:** EVIDENCE STARTED — NOT SCORABLE. Exact GitHub plan entitlements, CI integration, team workflow and operating ownership remain unknown.

## 6. Cross-component acceptance tests

1. Trace one synthetic API request through database transaction, outbox, worker, provider adapter and final status using one correlation ID.
2. Duplicate/out-of-order queue delivery does not create duplicate domain effects.
3. A poison job is visible and quarantined; replay is authorized and auditable.
4. Logs/traces redact secrets, signed URLs, personal data, buyer-confidential content and document payloads.
5. Retention/deletion rules are tested for telemetry and audit separately.
6. Upload a synthetic harmless test file and a safe EICAR test fixture into quarantine; scanner detects/quarantines as expected.
7. Scanner timeout, signature update failure, encrypted archive and unsupported file type remain quarantined.
8. A clean scan result cannot mark evidence independently verified or change batch approval.
9. GitHub dependency and secret scans detect seeded test findings without exposing real secrets.
10. A scanner/action/tool failure blocks release or raises a documented exception; it does not silently pass.
11. SBOM, tool versions, rules/signature versions and CI outputs are linked to the exact commit/build.
12. Independent reviewer checks false-positive/false-negative handling, alert routing and recovery.

## 7. Disposition and next actions

- TC-08 queue/scheduler: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-11 OpenTelemetry + Grafana Cloud: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-11 self-hosted Grafana OSS stack: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-22 ClamAV quarantine worker: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-22 GuardDuty Malware Protection for S3: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-23 GitHub-native security tooling: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-23 Trivy/Gitleaks CI scanning: **EVIDENCE STARTED — NOT SCORABLE**.

Next:
1. Confirm operational owner and incident response model before choosing telemetry.
2. Confirm selected object store before choosing provider-specific malware scanning.
3. Confirm GitHub repository-owner plan and entitlements before comparing paid security add-ons.
4. Define data minimization, telemetry retention and privacy/legal review.
5. Add each candidate to TSBBF workbook; no numeric score until terms, workload, operator and test evidence are complete.

**No queue, telemetry backend, malware scanner or paid developer-security add-on is selected or approved by this pack.**
