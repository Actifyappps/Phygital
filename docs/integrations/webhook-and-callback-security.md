# Webhook and provider callback security

## Required controls
- Verify signatures or equivalent authenticity using the provider's documented method; reject unsigned or invalid callbacks.
- Enforce timestamp tolerance and replay protection.
- Persist provider event IDs and enforce idempotent processing.
- Validate amount, currency, transaction reference, beneficiary, order and expected state against server-side records.
- Treat callback payloads as untrusted input; schema-validate and size-limit.
- Separate received, authenticated, accepted, applied and reconciled statuses.
- Quarantine unknown, duplicated, out-of-order or contradictory events for review.
- Never let a callback alone grant seller/exporter authority, certify quality, establish custody or mark dispatch complete.
- Do not log secrets, full payment credentials or unnecessary personal data.
- Preserve raw evidence securely where lawful and necessary, with retention and access controls.

Payment integration remains inactive until D-07 conditions and the applicable provider/legal/operational gates are met. The platform must not receive or hold transaction funds.
