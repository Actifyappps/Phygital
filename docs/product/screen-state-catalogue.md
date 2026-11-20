# Screen state catalogue

**Source:** 024-E §11.  
Every screen defines applicable states explicitly. State labels must never imply legal authority, physical movement, payment receipt or verification without source evidence.

| State | Required presentation | Safe action / constraint |
|---|---|---|
| Initial/loading | Clear loading/skeleton; no blank success | Retry only when safe |
| Empty | Why no records exist and permitted next step | No fabricated records |
| Draft/unsaved | Draft and persistence status | Distinguish save from submit |
| Submitted/pending review | Reference, queue status where permitted | No claim of approval |
| Active/current | Source, version, last update | Current permission/state rechecked |
| Held/blocked | Appropriate reason, responsible next step, escalation | No prohibited action |
| Expired/revoked/superseded | Invalidity and replacement route | Disable stale action |
| Validation error | Field and summary errors | Preserve safe input |
| Permission denied | Contextual access denial | Do not reveal protected record existence |
| Conflict/stale version | Authoritative current version and local changes | Safe refresh/merge/review |
| Offline/unsynced | Local-only/pending sync label | Never present as server accepted |
| Sync accepted/rejected/conflict | Per-action result and server reference | Explicit recovery guidance |
| External provider pending/failed | Provider/source and last attempt | Reconcile; no duplicate side effect |
| Not found/inaccessible | Neutral unavailable response | Prevent enumeration |
| Service unavailable | Preserve safe work; outcome known/unknown | Safe retry/idempotency handling |

## Screen-level state requirements
- All material actions show actor/capacity context and the active organisation.
- Evidence class E1–E4 and acquisition type are separate.
- Quantity, unit, currency and date precision are explicit.
- High-impact actions have reason capture and confirmation.
- Screen state derives from domain state; client-side optimistic state is visibly provisional.
