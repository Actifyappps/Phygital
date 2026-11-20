# P1 business-capability evidence pack — QR, notifications, payment status, laboratory evidence and analytics

**Evidence date:** 20 November 2026  
**Scope:** TC-14 public QR/batch projection; TC-15 notifications; TC-16 payment-status/provider adapter; TC-18 laboratory/inspection evidence; TC-20 analytics/reporting.  
**Status:** Initial source-derived and public-source evidence only. No provider, laboratory, payment rail, analytics platform or QR service is selected, scored or approved.

## 1. Purpose and authority

This pack covers P1 business-facing capabilities required for a complete pilot architecture decision. It deliberately separates:
- public presentation from private evidence;
- notification delivery from business state;
- payment-status recording from payment initiation/custody;
- laboratory evidence ingestion from verification authority;
- descriptive reporting from predictive/AI claims.

The governing baseline remains Concept Paper v1.1, 018-A sponsor decisions, 024-A–G, 024-R and the Phase 0 work map. No live partner, buyer, laboratory, payment provider, carrier or participant data connection is authorized.

## 2. TC-14 — QR and public batch projection

### 2.1 Required pattern

A QR code is a physical pointer to a controlled public projection, not a credential and not proof that the physical product is genuine. The baseline should be a QR code encoding a URL with a high-entropy opaque token; the resolver returns only explicitly allow-listed public fields for that batch.

### 2.2 Source-derived controls

- Generate cryptographically random, non-sequential tokens (e.g. at least 128 bits of entropy); do not use batch IDs, database IDs, sequential counters or predictable hashes as public secrets.
- Store a hash of the resolver token where feasible; retain a token ID, status, creation time, expiry/revocation and audit trail.
- QR scan does not authenticate a user and does not grant access to private documents, operational actions or account data.
- Public projection is a separate allow-list, not a private record with a few fields hidden.
- Do not encode personal data, KYC, private document links, commercial terms, buyer identities, payment data, exact sensitive locations or unverified claims in the QR payload.
- Distinguish declared/submitted, documentary, independently reviewed, verified, expired, revoked, disputed and unknown states. A digital record does not imply certification.
- A copied QR can be placed on counterfeit goods. The page must explain that the code resolves to a record and does not by itself prove the physical item is the original.
- Support revocation, reissue, token rotation, rate limiting, enumeration resistance, cache invalidation and abuse monitoring.
- Keep batch identity and public projection version separate; projection changes must be auditable.
- Blockchain anchoring is deferred unless a later evidence-based decision demonstrates measurable value and solves source-of-truth, privacy, correction, revocation and governance questions.

### 2.3 Implementation candidates

| Pattern | Assessment |
|---|---|
| Standard QR encoder library + server-side opaque token resolver | Candidate baseline; library is replaceable, token generation/resolution is the security boundary |
| Static QR + versioned public projection | Useful where projection changes infrequently; revocation and cache invalidation still required |
| Blockchain-backed public record | DEFERRED; not justified by the pilot evidence and introduces privacy, correction, key and governance complexity |

**Status:** EVIDENCE STARTED — NOT SCORABLE. No QR library or token format is selected.

### 2.4 Minimum synthetic tests

1. Predictable/sequential token enumeration fails.
2. Token with insufficient entropy or invalid format is rejected.
3. Revoked/expired token no longer resolves to current projection.
4. Public endpoint reveals only allow-listed fields; no private object URL or tenant metadata.
5. Cache invalidation after revocation/recall works.
6. Rate limits and abuse controls resist bulk scraping.
7. Copied QR scenario is clearly represented as a record lookup, not authenticity proof.
8. Public status labels never convert submitted evidence into independently verified/certified claims.

## 3. TC-15 — Notifications and communications

### 3.1 Candidate providers and channels

**Africa's Talking (Kenya SMS)**
- Offers SMS, two-way SMS/shortcodes, USSD and other services in Kenya.
- Its API response status 101 “Sent” means handed to the telco; the later delivery report callback is needed to distinguish delivered, failed, rejected, buffered or expired.
- Kenya Sender ID registration has country/operator-specific approval requirements and lead times. Public help material contains older fee/timing examples; obtain a current written quote and carrier approval before any cost or launch assumption.
- Current pricing for the exact sender ID, transactional category, carrier route and volume was not established by this snapshot.

Official sources:
- [Africa's Talking SMS API getting started](https://help.africastalking.com/en/articles/2258472-how-do-i-start-sending-messages)
- [Africa's Talking SMS status codes and delivery reports](https://help.africastalking.com/en/articles/16150386-messaging-error-codes)
- [Africa's Talking Kenya Sender ID requirements](https://help.africastalking.com/en/articles/407085-how-do-i-set-up-my-sender-id-in-kenya-or-uganda)
- [Africa's Talking delivery report callback](https://help.africastalking.com/en/articles/2206161-how-do-i-configure-my-callback-url)

**Twilio (international SMS/API)**
- Twilio's Kenya pricing page (November 2026) lists outbound SMS to Kenya via international numbers at **$0.3134 per message segment**, with additional carrier fees possible; messages are billed per segment.
- The public page's displayed international-number rate is not a complete quote for a locally registered alphanumeric sender ID or a dedicated Kenyan route. Confirm local sender options, carrier fees, throughput and sender approval before comparison.
- Twilio documents delivery insights and opt-out handling, but the exact callback statuses, sender type and route must be tested.

Official sources:
- [Twilio Kenya SMS pricing](https://www.twilio.com/en-us/sms/pricing/ke)
- [Twilio SMS API documentation](https://www.twilio.com/docs/messaging/api/message-resource)

**Amazon Simple Email Service (SES)**
- Current pricing page shows an Essentials plan at **$0.16 per 1,000 emails** for the first 0–10 million monthly emails, with lower marginal tiers at higher volume; Pro and Enterprise add monthly account/region charges.
- Email delivery is not guaranteed by API acceptance. Bounce, complaint, suppression, domain authentication and sending reputation controls are required.
- Configure SPF, DKIM and DMARC; handle bounce/complaint events and suppression lists; separate transactional from marketing email.

Official sources:
- [Amazon SES pricing](https://aws.amazon.com/ses/pricing/)
- [Amazon SES identity/domain authentication](https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication.html)
- [Amazon SES event publishing](https://docs.aws.amazon.com/ses/latest/dg/monitor-using-event-publishing.html)

### 3.2 Phygital notification rules

- Notifications are an adapter-driven delivery service, not the source of truth for workflow state.
- Persist notification intent/outbox, recipient, channel, template/version, purpose, consent/preferences, send attempts, provider message ID, delivery status and suppression state.
- Distinguish queued, accepted by provider, handed to carrier, delivered, failed, rejected, expired and unknown.
- Do not treat “sent” or API accepted as “delivered” or “read.”
- Retry only under bounded policy and idempotency; do not create duplicate notifications on retries or provider callbacks.
- Respect transactional/promotional category, consent, opt-out, quiet hours, language and applicable Kenya/destination-market rules.
- Do not send confidential buyer terms, KYC, payment credentials or sensitive evidence in SMS.
- Link users to authenticated application pages rather than embedding sensitive information in message content.
- Keep provider credentials server-side and verify callbacks; preserve message IDs and callback provenance.
- Provide email/in-app notification alternatives where SMS delivery fails; never make SMS the only record of a critical decision.
- Do not activate bulk advisories or AI-generated SMS in the pilot without separate legal, consent, accuracy and cost gates.

### 3.3 Minimum synthetic tests

1. Provider accepted/sent status remains distinct from handset delivery.
2. Duplicate callback and retry do not duplicate notification state.
3. Invalid sender ID, carrier rejection, blacklist/opt-out, insufficient balance and route failure are visible.
4. Opt-out and preference changes prevent future non-essential sends.
5. Sender ID approval and message category are validated before production use.
6. Message template is localized and contains no sensitive payload.
7. Email SPF/DKIM/DMARC and bounce/complaint/suppression paths are tested.
8. Provider outage falls back to in-app status/controlled manual communication.
9. Notification event history is auditable but does not replace the underlying workflow decision.

**Status:** EVIDENCE STARTED — NOT SCORABLE. No notification provider, sender ID, message volume, consent model or live channel is approved.

## 4. TC-16 — Payment-status and provider adapter

### 4.1 Non-negotiable sponsor boundary

018-A D-07 requires direct buyer-to-seller payment. The platform is not the default payee, merchant of record, funds holder, escrow agent or payout intermediary. Phygital may record payment instructions/status, provider references, authenticated events and reconciliation evidence; it does not thereby initiate, receive, hold, split or release funds.

A PSP's appearance in a regulator directory does not establish that it supports the exact export transaction, currency, buyer country, seller account structure, direct settlement, FX, refund, chargeback or settlement route required.

### 4.2 Kenya regulatory source

The Central Bank of Kenya's **Directory of Authorized Payment Service Providers as at 10 August 2026** includes providers such as Safaricom PLC, Cellulant Kenya Limited, Pesapal Limited, Direct Pay Limited, Paystack Payments Kenya Limited and DLocal Payments Kenya Limited. The directory's approved-service descriptions vary; some entries include issuing/processing/storing/sending mobile money, while others are authorized to provide platforms facilitating payment processing on behalf of merchants.

This is a regulatory discovery source, not an endorsement or a statement that any listed provider is suitable for cross-border export settlement. Verify the exact legal entity, current licence, approved service scope, seller merchant onboarding, buyer country, currency, settlement destination, FX, refunds, chargebacks, data processing and direct buyer-to-seller flow with CBK/provider/legal counsel before any integration.

Official source:
- [CBK Directory of Authorized Payment Service Providers — 10 August 2026 PDF](https://www.centralbank.go.ke/wp-content/uploads/2026/09/Directory-of-Authorized-Payment-Service-Providers-August-10-2026.pdf)

### 4.3 Candidate integration pattern

- Provider adapter exposes internal status and reconciliation contracts only.
- Seller's approved payment account and provider contract remain between buyer/seller and the licensed provider/bank as appropriate.
- Platform records payment terms/reference, expected amount/currency, provider identity, external transaction ID, event ID, status, timestamps, reconciliation outcome and evidence.
- Provider webhook must be authenticated (signature/HMAC or provider-specific verification), timestamp/replay checked, idempotent and reconciled to provider records.
- Screenshot, browser redirect, user declaration or unsigned callback is not proof of payment.
- Amount/currency/recipient mismatch, duplicate event, refund/chargeback, partial settlement and unknown status enter reconciliation/hold.
- No payment event changes inventory/custody/dispatch state unless the separate approved business workflow explicitly allows that state change.
- No escrow, wallet, pooled account, split payment, payout, payment initiation or funds custody is introduced under this adapter.

### 4.4 Minimum synthetic tests

1. Forged, unsigned, stale and replayed callback rejected.
2. Duplicate provider event is idempotent.
3. Amount/currency/recipient mismatch creates hold/reconciliation case.
4. Browser redirect/screenshot cannot mark payment as verified.
5. Provider timeout and late callback reconcile without duplicate transition.
6. Refund, reversal, chargeback and partial settlement preserve event history.
7. Platform cannot become payee/merchant of record by default.
8. Provider status cannot imply dispatch, custody or shipment.
9. Reconciliation report links expected terms to provider evidence and exception owner.

**Status:** EVIDENCE STARTED — NOT SCORABLE. No PSP, bank, payment rail, seller contract or live payment integration is selected.

## 5. TC-18 — Laboratory, inspection and standards evidence

### 5.1 Accreditation source

KENAS states that testing laboratories are accredited to **ISO/IEC 17025:2017** for competence of testing and calibration laboratories. Its published scopes include chemical, biological, physical, mechanical, environmental, food, water, pesticide, agriculture and other testing categories. KENAS states that accredited facilities are assessed periodically and participate in relevant proficiency-testing programmes.

Accreditation is scope-specific. The platform must verify the laboratory's current accreditation status and detailed scope for the exact commodity, sample type, test method, measurement range, location and date. A laboratory's general accreditation does not mean every test it offers is accredited.

Official source:
- [KENAS — Testing Laboratories Accreditation to ISO/IEC 17025](https://kenas.go.ke/accreditation/schemes/testing)

### 5.2 Candidate intake patterns

1. Controlled manual evidence intake from an identified laboratory/inspection provider, with verified issuer contact, signed report and scope check.
2. Provider portal/API integration only after provider identity, accreditation scope, data contract, authentication, provenance, correction and revocation are agreed.
3. Hub/operator measurements are recorded as hub observations, not automatically as accredited lab results or independent certification.

### 5.3 Evidence fields and controls

- Issuing legal entity, facility/site, accreditation body, certificate/schedule identifier and validity.
- Exact accredited scope, method, commodity/sample matrix, units, range, uncertainty/precision and limitations.
- Sample ID, sampling method, collection time/location, collector, seal/chain-of-custody references and receipt condition.
- Test date, analyst/reviewer, report number/version, results, units, decision rule and signed report hash.
- Amendments, withdrawals, invalidation, retest and supersession history.
- Distinguish accredited test result, non-accredited test, inspection observation, hub measurement, producer declaration and unverified document.
- No digital label may expand the laboratory's accredited scope or imply a regulatory clearance that the report does not establish.

### 5.4 Minimum synthetic tests

1. Valid report with matching lab, scope, method, commodity and date can be reviewed.
2. Expired/out-of-scope accreditation is flagged and cannot be labelled accredited.
3. Report issuer and signature/source are verified independently.
4. Amended/withdrawn report supersedes but does not erase prior record.
5. Unit/range/uncertainty are retained without silent conversion.
6. Sample chain-of-custody gap is flagged for review.
7. Hub measurement is not represented as laboratory certification.
8. Public projection exposes only approved result/status fields.

**Status:** EVIDENCE STARTED — NOT SCORABLE. No laboratory, inspection company, accreditation scope or API partner is selected.

## 6. TC-20 — Analytics and reporting

### 6.1 Baseline pattern

Start with governed SQL views, aggregate tables and controlled CSV/JSON exports over the operational PostgreSQL source. Metrics must be defined, lineage-backed, access-scoped and descriptive. Do not introduce a warehouse, streaming analytics stack or AI forecast until volume, use cases and lawful data supply justify it.

Initial measures may include:
- verified supply quantity and seasonality;
- listing/enquiry/quotation conversion and response times;
- order/reservation and exception volumes;
- price observations with source/date/currency/units;
- batch evidence completeness and quality status;
- hub service throughput and unresolved operational issues;
- payment-status reconciliation (not platform revenue or funds held);
- buyer/producer engagement and outcome indicators with privacy minimization.

Do not derive price indices, producer incomes, export volumes, verified quality rates or market forecasts from incomplete/unrepresentative data. Denominators, time windows, missing data and evidence class must be visible.

### 6.2 Candidate BI tools

**Apache Superset**
- Apache project; Apache-2.0 licensing.
- Provides role-based access, dataset permissions and row-level security features.
- Requires a production deployment, metadata database, cache/worker configuration and operator ownership.
- Its default roles are powerful: Admin has full control; Gamma is limited to granted data sources; dashboard/dataset access must be configured carefully. Do not connect it with broad write access to the production database.

Official sources:
- [Apache Superset security](https://superset.apache.org/docs/security/)
- [Apache Superset project](https://superset.apache.org/)

**Metabase**
- Open Source Edition is AGPL. Commercial Enterprise Edition has a separate commercial licence; embedding/white-label requirements may trigger licence obligations.
- Public Cloud Starter currently starts at $100/month plus $6/user/month (first five users included); Pro is listed at $575/month plus $12/user/month (first ten users included), with multi-tenant row/column security, SSO, audit and embedding features.
- Free Open Source edition can be self-hosted, but does not provide all advanced multi-tenant/SSO/audit features in paid tiers.
- Must isolate tenant data and restrict SQL access; embedding does not replace Phygital authorization.

Official sources:
- [Metabase licensing](https://www.metabase.com/license)
- [Metabase pricing](https://www.metabase.com/pricing)

### 6.3 Analytics architecture controls

- Use read-only roles and curated views; do not give BI users direct access to unrestricted operational tables.
- Keep analytics aggregates separate from authoritative transaction state.
- Enforce tenant/organisation scope and row-level security for internal and embedded dashboards.
- Suppress or aggregate small cohorts where re-identification risk exists.
- Log exports, query access and dashboard sharing.
- Define metric owner, formula, units, currency, source, update frequency, missing-data handling and quality limitations.
- Version metric definitions and preserve calculation lineage.
- No AI demand forecasting or automated advisory messages until sufficient lawful historical data, backtesting, accuracy/uncertainty, bias and recipient consent are evidenced.

### 6.4 Minimum synthetic tests

1. Read-only analytics role cannot write or alter operational records.
2. Cross-tenant dashboard/query/export is denied.
3. Public dashboard exposes only deliberately approved aggregate fields.
4. Metric definition reproduces from synthetic fixtures and includes denominator/source/time window.
5. Missing/stale/unverified records are not presented as verified outcomes.
6. Small-cell aggregation prevents re-identification where required.
7. Export access is logged and scoped.
8. Dashboard and query results can be rebuilt from versioned SQL/definitions.

**Status:** EVIDENCE STARTED — NOT SCORABLE. No BI platform, data warehouse, forecast model or public analytics dashboard is selected.

## 7. Cross-component candidate disposition

- TC-14 QR/public projection: standard QR library + opaque token resolver — **EVIDENCE STARTED — NOT SCORABLE**; blockchain — **DEFERRED**.
- TC-15 notifications: Africa's Talking SMS, Twilio SMS, Amazon SES email, in-app notifications — **EVIDENCE STARTED — NOT SCORABLE**.
- TC-16 payment status: CBK-authorized PSP/bank adapter candidates — **EVIDENCE STARTED — NOT SCORABLE**; no provider selected.
- TC-18 laboratory/inspection: KENAS-scope-verified provider with controlled manual intake or future API — **EVIDENCE STARTED — NOT SCORABLE**; no lab selected.
- TC-20 analytics: governed SQL views/exports, Apache Superset, Metabase — **EVIDENCE STARTED — NOT SCORABLE**.

## 8. Common closure requirements

1. Confirm exact legal, privacy, commercial and data-processing terms for any provider.
2. Validate pilot commodity, destination, buyer, seller/exporter, route and partner roles before payment/lab integration.
3. Confirm actual notification recipients, consent, language, message categories and delivery requirements.
4. Obtain current provider quotes, sender-ID approvals, delivery routes and volume assumptions.
5. Verify accreditation scope and validity per test method and commodity, not merely the laboratory name.
6. Define public projection fields and revocation/correction rules before printing live QR codes.
7. Define metric owners, denominators, data lineage and privacy safeguards before dashboards.
8. Add candidate records to the TSBBF workbook; no score until evidence is complete.

**No QR production, bulk messaging, payment initiation, PSP connection, laboratory integration, public analytics, AI forecast or real participant data is authorised by this pack.**
