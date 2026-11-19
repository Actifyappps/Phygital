# Inventory and allocation domain

Owns batch ledger entries, quantity balances, reservations, allocations, releases and reconciliation. Enforce non-negative balances, concurrency-safe reservations, idempotency and traceability. Allocation is reservation only, not physical movement or dispatch. Pilot starts with one batch; any compatible multi-batch logic needs explicit rules and tests.