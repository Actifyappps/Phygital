# Source-of-truth hierarchy and conflict handling

## Authority order
1. **Concept Paper v1.1:** strategic purpose, phygital model and staged pillars.
2. **018-A Sponsor Decision Pack:** current sponsor selections D-01–D-07, approved with conditions on 17 November 2026.
3. **Phase 0 validation/evidence records:** actual buyer, producer, exporter, facility, provider, route, regulatory and commercial evidence.
4. **Technical Development Manual v3.0:** supporting implementation plan; it does not supersede the Concept Paper.
5. **024 — Digital Marketplace Product Blueprint v0.1d:** product scope and system requirements.
6. **024-A to 024-G:** authority/permissions; workflows/states/rules; information architecture/data model; API/integration contracts; screens/interactions; security/privacy/threats; test strategy/acceptance evidence.
7. **Actify TSBBF and AADDG:** technology selection and engineering lifecycle controls.
8. **Repository ADRs, code, migrations, tests and deployment configuration:** implementation records subordinate to the sources above.
9. **Runtime evidence:** proves only what was actually executed in the identified environment and version.

## Canonical source register
- 018-A — Sponsor Decision Pack: https://app.notion.com/p/4136808bcd9e814981ffecf66f2d86ef
- 024 — Product Blueprint: https://app.notion.com/p/41c6808bcd9e8169a0b4c17a205abe25
- 024-A — Authority & Permission Matrix: https://app.notion.com/p/41d6808bcd9e81deaf78fe3ab8514043
- 024-B — Workflow, State & Business Rules: https://app.notion.com/p/41d6808bcd9e8111b08cc0c3006e22b8
- 024-C — Information Architecture & Data Specification: https://app.notion.com/p/41d6808bcd9e8196ae03ef401018f5d1
- 024-D — API & Integration Contracts: https://app.notion.com/p/41d6808bcd9e81fc91d5f462eb3deb8a
- 024-E — Screen & Interaction Specification: https://app.notion.com/p/41d6808bcd9e816d8acdce8763dedf25
- 024-F — Security, Privacy & Abuse Controls: https://app.notion.com/p/41d6808bcd9e817d8d16d37bc31c063e
- 024-G — Test Strategy & Acceptance Evidence: https://app.notion.com/p/41d6808bcd9e81c78dfdfa7919489c30
- 024-R — Independent Product Completeness Audit: https://app.notion.com/p/41d6808bcd9e8185bbaacd12d1d15eee
- Evidence Register protocol: https://app.notion.com/p/4136808bcd9e814fa4e3d261571c4f57
- Concept Paper v1.1: https://app.notion.com/p/afe6808bcd9e837c8636810cb305d97f
- Technical Development Manual v3.0: https://app.notion.com/p/7ba6808bcd9e82be811781eca90484ce

## Conflict protocol
1. Stop the affected implementation path; do not select the easiest interpretation.
2. Record the exact source passages, conflicting requirements, affected code/data/API/screens/tests and risk.
3. Classify whether the issue is clarification, defect, decision request or controlled change.
4. Identify the authorised decision owner and evidence required.
5. Continue independent work that does not depend on the conflict.
6. Update the source register, traceability links, ADRs and affected tests only after disposition.
7. Preserve superseded decisions and evidence; never silently rewrite history.

A code comment, schema, UI label, README or ADR cannot overrule a governing product or sponsor decision.

- Sponsor decisions D-01–D-07 detail: [approved-with-conditions decision record](sponsor-decisions-D01-D07.md).
