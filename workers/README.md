# Background processing workspace

Reserved for approved asynchronous jobs and scheduled tasks. Define ownership, idempotency, retry/backoff, dead-letter handling, observability, data scope and replay safety before implementing a worker. Do not use workers to bypass workflow approvals or external authority checks.