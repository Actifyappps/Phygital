# EVI-25 — Developer Guide v0.1 source-recovery and authority assessment 001

**Review date:** 21 November 2026  
**Evidence item:** EVI-25 — Establish authority of canonical Developer Guide v0.1 source  
**Status:** IN PROGRESS — source not recovered; authority not established  
**Scope:** Phygital Export Marketplace only

## 1. Executive finding

The complete canonical Developer Guide v0.1 was not recovered in the targeted Notion workspace, connected Library search or current `Actifyappps/Phygital` repository tree.

The current hierarchy is clear:
1. **Concept Paper v1.1** — strategic authority.
2. **Technical Development Manual v3.0** — supporting technical and operational plan.
3. **Phase 0 validation/evidence documents** — test assumptions and constrain delivery.
4. **Technical artefacts** — candidates until reviewed and approved under the applicable controls.

Developer Guide v0.1 remains **UNVERIFIED / NOT LOCATED**. The remembered excerpt is a source-recovery lead only, not an authoritative specification or valid technology-scoring basis.

## 2. Search and inspection performed

| Source | Inspection | Result |
|---|---|---|
| Notion workspace | Targeted searches for Developer Guide v0.1, Phygital Developer Guide, canonical source authority and related technology-guide terms | No complete Developer Guide page identified; searches returned the source-authority register item, Project Home, Manual v3.0 and related architecture records. |
| Current Project Home | Inspected governing document hierarchy | Confirms Concept Paper v1.1 as strategic authority and Manual v3.0 as supporting implementation plan. |
| Notion Manual v3.0 | Inspected accessible v3.0 pages | Explicitly a technical planning manual, not production readiness or final stack selection. |
| Connected Library | Searched title and distinctive stack terms (Next.js, Vercel, Supabase, PostgreSQL, Auth, RLS, private storage) | Manual v3.0 and earlier manual artefacts surfaced; no complete Developer Guide v0.1 identified. |
| GitHub repository | Inspected recursive `main` tree for Developer Guide, technical manual, architecture and technology artefacts | No file identifiable as the canonical Developer Guide v0.1 was present. |
| Existing repository controls | Inspected technology-decision status and ADR readiness records | Both already identify the guide as unrecovered and require verification before technology scoring. |

This is a targeted search of accessible sources, not proof that no copy exists in an external drive, personal device, email or unconnected system.

## 3. Sources located and authority

- [Concept Paper v1.1](https://app.notion.com/p/afe6808bcd9e837c8636810cb305d97f) remains the strategic baseline, subject to its stated draft-for-partner-discussion status.
- [Technical Development Manual v3.0](https://app.notion.com/p/4136808bcd9e8183bbc5efb4f6b05859) is the supporting implementation plan. It recommends a modular-monolith-first logical direction and describes candidate components; it does not select a final technology stack or authorize production.
- [Current Project Home](https://app.notion.com/p/44c6808bcd9e825a9a640180d9c740c0) confirms the governing hierarchy.
- `docs/architecture/technology-decision-status.md` maintains the open technology decision.
- `docs/architecture/technology-decision-requirements-baseline.md` is the technology-neutral comparison baseline.
- `docs/architecture/technology-component-register.md` is an inventory, not a vendor shortlist.
- ADR-0001 and ADR-0002 remain OPEN.
- TSBBF v1.0 governs evidence-based selection/build-vs-buy; AADDG v1.0 governs repository and operational controls. Neither selects a Phygital stack.

## 4. Excerpt and conflict handling

Prior project review notes identify a 17 November excerpt describing Next.js/Vercel with Supabase/PostgreSQL/Auth/RLS/private storage as a candidate path. The complete source, title page, author/custodian, version history, approval status and complete text are not available in the inspected source set.

The excerpt may guide source recovery only. It must not be scored as a complete candidate specification or treated as superseding Manual v3.0, TSBBF, AADDG, the 024 specifications or sponsor decisions.

There is not yet a proven substantive conflict between two complete documents. The observed difference is a more specific candidate stack in the excerpt versus the multiple framework/provider candidates and modular-monolith logical approach in Manual v3.0. This is currently a source-completeness/provenance gap, not grounds to select either stack.

## 5. Authority determination

| Question | Finding |
|---|---|
| Complete Developer Guide located? | No, not in targeted accessible-source search. |
| Provenance and custodian established? | No. |
| Approval status established? | No. |
| Completeness/version integrity established? | No. |
| Safe to treat as authoritative? | No. |
| Governing sources meanwhile? | Concept Paper v1.1 for strategy; Manual v3.0 for supporting technical planning; current programme controls, TSBBF and AADDG for decision discipline. |
| Can technologies be scored from excerpt alone? | No. |

**Disposition:** Developer Guide v0.1 = UNVERIFIED / NOT LOCATED. Existing hierarchy remains unchanged.

## 6. Required closure actions

1. Obtain the complete original Developer Guide v0.1 from its source custodian/document author, including title page, date, author, version history and approval/circulation record.
2. Record original file/page location, file hash where bytes are available, and chain of custody.
3. Compare it against Concept Paper v1.1, Technical Development Manual v3.0, TSBBF v1.0, AADDG v1.0, 024-A–G and relevant sponsor decisions.
4. Classify statements as strategic requirement, technical proposal, candidate selection, implementation instruction, assumption or unsupported claim.
5. Prepare a conflict/precedence schedule; do not silently merge incompatible recommendations.
6. Obtain an authorised decision: authoritative, advisory, superseded or formally unavailable.
7. Only then update technology requirements and ADR evidence inputs.

## 7. Boundaries

This assessment does not approve any framework, provider, database hosting, deployment topology or technology stack. It does not authorize WP-05, procurement, account creation, migration, deployment, production use or live integrations. It does not close EVI-25 or ADR-0001/ADR-0002.

## 8. References

- [Notion source-recovery assessment](https://app.notion.com/p/41f6808bcd9e8130846cf2d7c22b16c0)
- [Project Home](https://app.notion.com/p/44c6808bcd9e825a9a640180d9c740c0)
- [Concept Paper v1.1](https://app.notion.com/p/afe6808bcd9e837c8636810cb305d97f)
- [Technical Development Manual v3.0](https://app.notion.com/p/4136808bcd9e8183bbc5efb4f6b05859)
- [Technology decision status](../architecture/technology-decision-status.md)
- [ADR-0001](../decisions/ADR-0001-technology-baseline.md)
- [ADR-0002](../decisions/ADR-0002-application-topology.md)

**Prepared as a source-recovery assessment. Independent source-custodian confirmation and authorised disposition remain outstanding.**
