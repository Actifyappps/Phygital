# Requirements traceability control

Every material requirement must be traceable through:

**Source and version → requirement ID → authority/actor → domain owner → workflow/state → data invariant → API/event contract → UI surface → security/privacy control → test case → evidence result → reviewer disposition.**

## Traceability rules
- Keep Notion as the live source of programme requirements and evidence registers where designated; GitHub owns implementation artefacts and engineering change history.
- Record exact source page, version, status and retrieval date in the source-document register.
- Mark each requirement: mapped, designed, implemented, tested, independently reviewed, accepted, deferred, rejected or superseded. These states are not interchangeable.
- A requirement mapped to a folder or README is not implemented.
- Test case authored is not test executed; execution is not independent review; review is not programme gate closure.
- Contradictions are logged with source hierarchy, decision owner and resolution; never silently harmonise conflicting documents.
- Preserve historical requirements and supersession links.
