# API, command, query and event contract rules

024-D is the logical contract authority. This file establishes implementation hygiene without selecting REST, GraphQL, RPC, event broker or framework.

## Contract requirements
- Every operation has a stable identifier, purpose, owner context, actor/authority, scope, preconditions, request/response schema, errors and audit effects.
- State-changing operations are commands; read-only operations are queries.
- Validate authority, workflow state, version, evidence and programme gate server-side.
- Use explicit idempotency keys for retriable commands and provider callbacks.
- Version public/provider contracts; define compatibility and deprecation.
- Use stable error codes and safe messages; never leak cross-tenant existence or sensitive data.
- Include correlation/trace IDs without placing secrets or personal data in them.
- Paginate and bound queries; enforce tenant and resource scope in the data layer.
- Use optimistic concurrency or equivalent for mutable records.
- Define time zone, currency, unit, precision and rounding semantics explicitly.

## Event requirements
Distinguish facts from commands. Events are immutable facts with event ID, schema version, occurred-at and received-at timestamps, actor/service identity, organisation scope, correlation/causation IDs, source, payload classification and evidence references. Consumers must be idempotent and tolerate duplicate delivery. Do not emit events that imply custody, dispatch, payment receipt or verification unless the relevant evidence and authority exist.

No production API or provider integration is authorised by this design note.
