# TC-09 and TC-10 — initial hosting, deployment and CI evidence snapshot

**Evidence date:** 20 November 2026  
**Assessment status:** Initial public-source evidence captured; NOT A SCORECARD, shortlist or selection.  
**Currency:** USD public list prices as displayed on source pages; taxes, seats, overages, data transfer, add-ons and actual workload are not normalized.

## 1. Purpose and decision boundary

This record begins provider-specific evidence for:
- TC-09 hosting/deployment: Vercel, Cloudflare Pages/Workers and Render.
- TC-10 CI/source control/build artifacts: GitHub Actions, platform-native Git builds and an independently hosted/self-hosted CI runner as alternatives.

GitHub remains the authoritative repository under AADDG. The CI runner and deployment provider are separate choices. A platform's automatic deployment from Git does not replace the full test, security, evidence-retention and approval pipeline. No service is selected or provisioned by this record.

## 2. Governing requirements

- Source and appropriate configuration remain in the authoritative GitHub repository.
- Development, preview/test and production environments are isolated.
- Build and deployment are reproducible from a reviewed commit and versioned configuration.
- Release artifact, test outputs, commit SHA, dependency inventory and approvals remain traceable.
- CI tokens are least-privileged; untrusted pull requests cannot access secrets or deployment permissions.
- Prefer short-lived OIDC credentials over long-lived deployment secrets where supported.
- Production deployment requires protected environment/branch approval and rollback.
- Host/runtime region must be chosen close to the database where possible; data residency and support/subprocessor processing require separate legal review.
- Runtime, request, CPU, memory, duration, concurrency, build, bandwidth, storage and overage limits must be explicit.
- No deployment platform or CI dashboard may be the only source of truth for schema, RLS, secrets references or critical configuration.

## 3. TC-09 — Hosting and deployment candidates

### 3.1 Vercel

**Public commercial and capability evidence**
- Hobby: $0/month, for personal/non-commercial use. Vercel explicitly says Hobby is for personal projects; Pro is designed for professional developers, freelancers and businesses. It is therefore not a valid commercial Phygital production baseline.
- Pro: **$20/month** platform fee, one deploying team seat included and $20/month usage credit; additional deploying seats and on-demand usage are billed separately.
- Pro includes 1 TB Fast Data Transfer and 10 million Edge Requests in the published plan details; resource-specific usage/overage rules apply.
- Vercel Functions default to the Washington, D.C. region (iad1) for new projects, but region can be configured. The current region list includes Singapore (sin1) and Cape Town (cpt1), among others.
- Vercel Functions support Node.js and other runtimes; Pro Node.js functions can run up to 30 minutes with Fluid Compute according to a June 2026 announcement, but durations above 800 seconds are marked beta in the cited release.
- Enterprise plan includes multi-region compute/failover and 99.99% SLA; these are not Pro entitlements.

**Fit and risks**
- Strong Next.js integration, Git-driven deployments, preview environments, CDN and spend management.
- Hobby commercial-use restriction must not be bypassed for Phygital.
- Function region must be explicitly aligned with database region; default iad1 can create avoidable cross-region latency.
- Pro included usage credit is not a complete hosting TCO; compute, data transfer, image optimization, build usage, seats, logs and add-ons need a workload model.
- Enterprise failover/SLA should not be assumed on Pro.
- Serverless functions are not a substitute for durable workers/queues; function duration, retries, idempotency and provider side effects still require design.

Official sources:
- [Vercel pricing](https://vercel.com/pricing)
- [Vercel Pro plan](https://vercel.com/docs/plans/pro-plan)
- [Vercel regions](https://vercel.com/docs/regions)
- [Vercel function limits](https://vercel.com/docs/functions/limitations)
- [Vercel function duration](https://vercel.com/docs/functions/configuring-functions/duration)
- [Vercel 30-minute function announcement](https://vercel.com/changelog/vercel-functions-can-now-run-up-to-30-minutes)

### 3.2 Cloudflare Pages / Workers

**Public commercial and capability evidence**
- Cloudflare Workers Paid plan has a minimum **$5/month per account**; it includes Workers, Pages Functions, Workers KV, Hyperdrive and Durable Objects with usage-based charges above included allowances.
- Workers Paid charges $0.30 per million requests and $0.02 per million CPU milliseconds on the current public pricing page; no additional data-transfer/egress or bandwidth charge.
- Workers Free has 100,000 requests/day, 10 ms CPU per request and 128 MB memory. Paid Workers allows up to 5 minutes CPU time, still with 128 MB memory and other subrequest/connection limits.
- Cloudflare Pages Free plan currently allows 500 builds/month, one concurrent build, 20-minute build timeout, 20,000 static files and 25 MiB per file. Deployment retention is 100 deployments, with older entries deleted when outside the 100 most recent/current production.
- Pages Git integration supports GitHub/GitLab, automatic deploys, preview deployments and commit/build status checks. Pages is now described as supported for existing use cases while Cloudflare recommends Workers for new full-stack projects.
- Cloudflare's Git integration has an important lifecycle constraint: a Git-integrated Pages project cannot later be switched to Direct Upload without creating a new project.

**Fit and risks**
- Strong global static delivery, low-cost Workers, Git integration, preview builds and no egress charges.
- Workers runtime is not a general unrestricted Node.js server; Node compatibility and library support must be tested.
- CPU/memory, subrequest, request body, duration and region/data handling limits must be tested against Phygital API/runtime needs.
- Cloudflare Pages deployment history is not an evidence archive; older deployments are deleted. Preserve release artifacts and test evidence separately in the repo/evidence store.
- Cloudflare Workers and Pages Functions are a different runtime model from a Node.js/NestJS/Express process; avoid assuming full compatibility.
- Data locality, jurisdiction, logs and subprocessor terms must be assessed independently of the global CDN.

Official sources:
- [Cloudflare Pages overview](https://developers.cloudflare.com/pages/)
- [Cloudflare Pages limits and deployment retention](https://developers.cloudflare.com/pages/platform/limits/)
- [Cloudflare Pages Git integration](https://developers.cloudflare.com/pages/configuration/git-integration/)
- [Cloudflare Pages known issues](https://developers.cloudflare.com/pages/platform/known-issues/)
- [Cloudflare Workers pricing](https://developers.cloudflare.com/workers/platform/pricing/)
- [Cloudflare Workers limits](https://developers.cloudflare.com/workers/platform/limits/)

### 3.3 Render

**Public commercial and capability evidence**
- Render Hobby workspace is $0/month plus compute; it is positioned for individual prototypes/personal projects.
- Render Pro workspace is **$25/month plus compute** and includes unlimited seats/services, 25 GB bandwidth, full-stack previews, autoscaling, isolated environments, OIDC authentication, AWS Private Links and workspace audit logs.
- Render Scale workspace is $499/month plus compute and adds advanced governance/compliance features such as SAML SSO/SCIM and advanced RBAC.
- Web services and background workers start at **$7/month** for 0.5 CPU/512 MB RAM. Bandwidth is separately metered after plan allowance.
- Render offers Node, Python, Go, Rust, Ruby and Elixir services, custom Docker containers, global regions, private networking and managed Postgres/Key Value.
- Render's published global region list includes Singapore and Frankfurt; exact regional availability and data processing terms must be checked for each service.

**Fit and risks**
- Strong fit for conventional long-running Node.js API and worker processes with private networking and Docker portability.
- Pro workspace fee plus per-service compute, databases, Key Value, storage and bandwidth compound; compare full architecture, not a single $7 service price.
- Hobby should not be treated as production-grade team deployment simply because a service can run there.
- Regional placement must keep app/worker close to database; multi-region failover and SLAs are plan-dependent.
- A conventional server/worker gives more runtime freedom than edge/serverless, but adds process, scaling, deployment and operational responsibility.

Official sources:
- [Render pricing](https://render.com/pricing)
- [Render regions](https://render.com/docs/regions)
- [Render web services](https://render.com/docs/web-services)
- [Render background workers](https://render.com/docs/background-workers)
- [Render private networking](https://render.com/docs/private-network)

## 4. Hosting comparison — facts, not scores

| Dimension | Vercel | Cloudflare Pages/Workers | Render |
|---|---|---|---|
| Main fit | Next.js and server-rendered web apps | Static/edge web apps and Workers runtime | Conventional Node/API/worker services and Docker |
| Commercial entry reference | Pro $20/month + seats/usage; Hobby non-commercial | Workers Paid minimum $5/month + usage; Pages Free with limits | Pro workspace $25/month + per-service compute; Hobby prototype tier |
| Kenya-adjacent compute region | Singapore and Cape Town listed | Global network; exact execution/data locality requires separate evidence | Singapore and Frankfurt listed |
| Runtime model | Managed Node/serverless functions; some duration limits | V8 isolate/Workers runtime; Node compatibility is not full Node | Long-running services and containers |
| Build/deploy | Git-driven automatic deployments and previews | Git integration and previews | Git-connected builds/deploys and previews |
| Key concern | Hobby non-commercial; Pro usage/seat costs; region/cache controls | runtime compatibility/limits; deployment retention; global data processing | workspace + service + bandwidth cost; ops and scaling |
| Status | EVIDENCE STARTED — NOT SCORABLE | EVIDENCE STARTED — NOT SCORABLE | EVIDENCE STARTED — NOT SCORABLE |

No host is recommended. Exact data location, contract terms, service limits, support and workload TCO remain unverified.

## 5. TC-10 — CI and build evidence

### 5.1 GitHub Actions

**Public usage and security evidence**
- GitHub Free includes 2,000 minutes/month, 500 MB Actions artifact storage and 10 GB cache per repository; GitHub Team includes 3,000 minutes and 2 GB artifact storage. Public repositories receive free standard hosted runner use. Actual entitlement depends on the repository owner's plan and billing settings; this record does not infer the Phygital organization's plan.
- Standard artifact/log retention defaults to 90 days. Private repositories can configure up to 400 days, subject to organization/enterprise caps; public repositories up to 90 days.
- GitHub recommends least-privilege GITHUB_TOKEN permissions, read-only default permissions where possible, avoiding privileged pull_request_target workflows for untrusted code, and using OIDC for short-lived cloud credentials.
- OIDC token permission id-token: write only allows the workflow to request an ID token; it does not itself grant resource write access. Cloud trust policies must bind repository, branch, environment and audience claims.
- Artifacts/logs count toward included storage and may be deleted when retention expires. Long-lived regulatory/acceptance evidence must not rely on default Actions retention alone.

**Fit and risks**
- Native source-control integration, pull-request checks, commit status, matrix tests, release provenance and OIDC.
- Risks are workflow supply chain, untrusted pull request execution, overprivileged tokens, mutable third-party actions and evidence expiry.
- GitHub Actions is a CI runner and workflow system; it is not the sole archive for all test/acceptance evidence.

Official sources:
- [GitHub Actions billing and usage](https://docs.github.com/en/actions/concepts/billing-and-usage)
- [GitHub Actions included usage by plan](https://docs.github.com/en/billing/concepts/product-billing/github-actions)
- [GitHub Actions limits](https://docs.github.com/en/actions/reference/limits)
- [Secure use reference](https://docs.github.com/en/actions/reference/security/secure-use)
- [GitHub Actions OIDC](https://docs.github.com/en/actions/reference/security/oidc)
- [Artifact and log retention](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository)

### 5.2 Platform-native build/deploy

Vercel, Cloudflare Pages and Render provide Git-connected build/deployment workflows. They can build preview and production artifacts, but should not automatically replace the governed CI suite:
- run source-level tests and security checks before deployment;
- preserve build/test identity and commit SHA;
- ensure preview environments use synthetic data and non-production credentials;
- gate production deploys on approvals;
- store test evidence independently of platform deployment retention;
- retain a portable build/deploy process so platform migration is possible.

### 5.3 Independent hosted or self-hosted CI

An independent CI service or self-hosted runner remains an alternative if GitHub Actions quotas, isolation or network requirements justify it. The additional service must be assessed for:
- OIDC/short-lived credentials and secret isolation;
- runner isolation, ephemeral lifecycle, network egress and patching;
- reproducible builds and artifact provenance;
- pull-request/fork threat handling;
- logs/artifact retention/export;
- cost, skills, availability and exit.

No third-party CI product has been selected or priced in this snapshot.

## 6. Mandatory Phygital deployment and CI acceptance

1. Clean checkout builds and tests using committed manifests/lockfiles.
2. Build and deployment are tied to exact commit SHA and dependency inventory.
3. Untrusted PR cannot access production secrets, write deployment credentials or alter protected branch.
4. Workflow tokens have least privilege; OIDC trust is limited to approved repository/branch/environment/audience.
5. Preview environment cannot access production database, storage, keys or participant data.
6. Production deploy requires protected environment approval and a known rollback artifact.
7. Authenticated responses are not cached/shared across tenants; cache rules are tested at host/CDN/runtime layers.
8. App/API/worker/database are deployed in intentionally selected regions; cross-region latency and data transfer are measured.
9. Logs/traces are correlated and redact personal data, credentials and signed URLs.
10. Evidence artifacts have a controlled retention/export path beyond platform defaults.
11. Runtime/build quotas, spend limits and failure alerts are tested.
12. Rebuild/rollback can be performed from GitHub and documented infrastructure/configuration without undocumented dashboard mutation.

## 7. Candidate disposition and next actions

- Vercel: **EVIDENCE STARTED — NOT SCORABLE**.
- Cloudflare Pages/Workers: **EVIDENCE STARTED — NOT SCORABLE**.
- Render: **EVIDENCE STARTED — NOT SCORABLE**.
- GitHub Actions: **EVIDENCE STARTED — NOT SCORABLE**.
- Platform-native build/deploy: **EVIDENCE STARTED — NOT SCORABLE**.
- Independent hosted/self-hosted CI: **UNASSESSED**.

Next:
1. Confirm repo-owner plan and actual GitHub Actions entitlements; do not infer from the user's ChatGPT plan.
2. Confirm target database region and compare function/worker regions and egress.
3. Obtain current DPA/subprocessor/support/SLA terms for Vercel, Cloudflare and Render.
4. Map selected frontend/runtime and worker patterns to host-specific limits.
5. Define evidence retention outside ephemeral platform deployments and default CI artifacts.
6. Add candidate records to TSBBF workbook; keep numeric scores blank until evidence is complete.

**No hosting, CI, production environment, domain, secret, deployment pipeline or production release is authorised by this snapshot.**
