# WP-05 — Synthetic technology spike readiness assessment

**Review date:** 20 November 2026  
**Governing plan:** docs/delivery/technology-spike-and-acceptance-plan.md  
**Status:** NOT READY — NOT AUTHORIZED. This is a gate assessment, not a spike execution record.

## 1. Executive disposition

The synthetic-data technology spike is **not ready to execute**. The existing spike plan is a sound test specification, but the prerequisites for a fair, authorized comparison have not been met.

The current repository contains public-source evidence snapshots for P0 and P1 components, a 48-entry candidate register and a proposed modular-monolith topology. These are evidence-preparation artefacts. They do not establish a final candidate shortlist, comparable workload assumptions, contractual suitability, approved budget/environment, named test owner or independent reviewers.

No provider account, environment, database, worker, CI pipeline, migration, real data or live integration may be provisioned or exercised under this readiness assessment.

## 2. Readiness gate matrix

| Gate | Required condition | Current evidence | Status |
|---|---|---|---|
| G-01 Source authority | EVI-25 closed by recovering/reconciling Developer Guide v0.1 or by authorized formal unavailability/supersession disposition with approved alternative source baseline | TSBBF v1.0 and AADDG v1.0 recovered/verified; EVI-25 IN PROGRESS; full guide source not recovered and no formal disposition recorded | BLOCKED |
| G-02 Comparable requirements | TDR-01–18 and component requirements frozen for the exact comparison | Technology requirements baseline and component packs exist; no candidate-specific requirements coverage sign-off | PARTIAL |
| G-03 Candidate readiness | At least two credible candidates per compared component have sufficient technical, security, legal, commercial and portability evidence | Public-source facts recorded; DPAs, subprocessor/region terms, operational limits, restore/exit and cost evidence incomplete | BLOCKED |
| G-04 Workload | Phase 0 users, organisations, concurrency, transactions, file sizes, connectivity, retention and operating assumptions validated | Most quantities remain UNKNOWN; Phase 0 instruments are not completed findings | BLOCKED |
| G-05 Legal/privacy | Data map, lawful purpose, transfer, DPA, region, retention and provider processing reviewed | No approved project data map or legal/privacy sign-off | BLOCKED |
| G-06 Security/test design | Synthetic fixtures, threat model, authorization matrix, test data classification and acceptance criteria approved | 024-F/024-G and spike matrix provide a baseline; no spike-specific fixture approval | PARTIAL |
| G-07 Environment | Isolated synthetic environment, budget, access controls, secrets, cleanup and rollback approved | No technology-spike environment or budget approval evidenced | BLOCKED |
| G-08 Ownership | Named implementation owner, operations owner, security reviewer and independent reviewer confirmed | Named owners/reviewers not evidenced | BLOCKED |
| G-09 Authorization | Authorized decision owner explicitly approves candidates, scope, spend, environment, dates and reviewers | No explicit WP-05 spike authorization recorded | BLOCKED |
| G-10 Acceptance and evidence | Exact versions, commands, commit, raw outputs, defect/retest and review evidence plan confirmed | Spike acceptance matrix exists; no run evidence | PARTIAL |

**Overall:** NOT READY. A partial design plan is not authorization to execute.

## 3. Candidate comparison scope that may be considered later

The initial public-source candidate set is broad. A first spike should be deliberately small and test only critical architectural risks. The following are candidate dimensions, not a current shortlist:

1. Database: two candidates selected only after region/DPA/backup/exit evidence and workload assumptions.
2. Identity/authorization: test trusted identity-to-application membership mapping, session revocation, tenant isolation and policy enforcement; do not compare every feature of every provider.
3. Private object storage: compare private access, short-lived link, quarantine, hash/version, restore and export.
4. Application runtime: compare a modular application boundary, validation, transactions, error handling and portability.
5. Worker/outbox: compare atomic enqueue, duplicate delivery, retry, DLQ/quarantine, replay and operator visibility.
6. Delivery/CI: prove reproducible build, untrusted PR isolation, least privilege and protected promotion.
7. Recovery/exit: restore the same synthetic data and linked objects into an independent environment.

Do not spike QR blockchain, connected measurement devices, escrow/payment initiation, customs automation, AI forecasts, multi-country deployment or real provider integrations in this first comparison.

## 4. Permitted work before authorization

- Continue source recovery and document reconciliation.
- Obtain current provider terms, DPAs, subprocessors, regions, limits and quotes.
- Complete Phase 0 validation instruments and workload assumptions.
- Complete the ECR-01–ECR-14 evidence requests.
- Refine synthetic fixtures and expected outcomes without connecting to real providers.
- Review the spike test matrix, security controls, data minimization and cleanup plan.
- Prepare a decision brief for the authorized owner.

## 5. Prohibited until the gates pass

- Creating provider production accounts or production resources.
- Provisioning a live database, identity tenant, storage bucket, queue, worker or public domain.
- Executing Migration 001 or drafting/deploying Migration 002 as an approved migration.
- Importing real participant, KYC, buyer, producer, bank, payment, laboratory or trade data.
- Connecting real payment, carrier, lab, government, SMS/email or banking integrations.
- Initiating/receiving/holding/splitting funds, escrow, custody, stock release, dispatch or shipment.
- Running a technology comparison and representing it as an approved product or independent acceptance.
- Claiming EVI-21 or Level 1 closure based on the technology spike plan.

## 6. Required authorization record

Before any WP-05 execution, record:
- decision owner and approval date;
- exact candidate products/services/versions and comparison question;
- approved budget and spending ceiling;
- synthetic-only data classification and fixture hash;
- isolated environment and region;
- secrets/access policy and named users;
- exact commands, build/commit and test versions;
- acceptance criteria, stop conditions and cleanup/rollback;
- implementation owner, operations owner, security reviewer and independent reviewer;
- evidence retention and final report location.

Approval must be explicit and limited to the stated scope. It does not authorize production deployment, real data, migrations or live commercial operations.

## 7. Next action and status

The next work is to close the evidence requests, not to run the spike. ECR-01 (Developer Guide source recovery/disposition), ECR-02/03 (workload/site evidence), ECR-04/05 (privacy/provider terms), ECR-06/07/08 (operations/TCO/recovery) and ECR-09/10 (payment/lab partners) are the principal blockers.

**WP-05 remains NOT READY — NOT AUTHORIZED. No spike has been run.**


## EVI-26 authorization record update — 21 November 2026

EVI-26 is IN PROGRESS as an authorization-readiness task. The WP-05 gate remains NOT READY — NOT AUTHORIZED. The detailed field-by-field decision brief is `docs/delivery/evi-26-wp05-synthetic-spike-authorization-readiness-001.md`. No candidate shortlist, environment, budget, named owner/reviewer or explicit authorization has been evidenced. No spike has been run.
