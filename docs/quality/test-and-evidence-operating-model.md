# Test execution and evidence operating model

## Test levels
Requirements review; static/source checks; unit; component; database constraint; integration; contract; end-to-end; security; privacy; accessibility; performance; resilience/offline; migration; backup/restore; operational rehearsal; independent review.

## Each test case must state
Stable ID; source requirement; risk/priority; actor and authority; environment/build; preconditions; synthetic fixture; exact steps; expected state and denied path; observed result; logs/screenshots/output; defect references; tester; reviewer; timestamp; retest and regression links.

## Evidence grades and integrity
Preserve raw output and identify generated summaries. Record commit SHA, build artefact hash, runtime/environment, data-fixture version, test tool/version and exact command. Do not edit raw logs. A rerun creates a new execution record. Redact secrets and personal data before storage.

## Independent review
Reviewer checks requirement coverage, procedure fidelity, raw output, reproducibility, defects, false-positive paths and whether the evidence supports the stated conclusion. Implementers do not self-accept their own material remediation where independence is required.

## Level 1 boundary
The v0.4 logic harness is not a browser test. The 16-step operator rehearsal, 12 browser negative tests and independent review remain outstanding; EVI-21 stays OPEN and Closure Accepted NO until the canonical closure criteria are met.
