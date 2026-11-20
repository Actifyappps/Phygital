# Level 1 rehearsal and evidence crosswalk

| Source | Purpose | Repository home | Evidence status |
|---|---|---|---|
| 021 | Rehearsal scope, test environment, positive/negative criteria and outcomes | `tests/level1/`, `docs/quality/` | Test plan |
| 022 | Synthetic data, 16 positive steps, 12 negative tests, reconciliation and operator observations | `fixtures/synthetic/level1/`, `tests/level1/` | Test data and workbook |
| 023 | Local prototype v0.4, instructions and known limitations | `tests/prototypes/level1/` | Candidate artifact |
| EVI-21 | Controlled execution, evidence capture and independent review | `evidence/level-1/` and Notion | OPEN / Closure Accepted NO |

## Prototype identity
- File: `tests/prototypes/level1/Phygital_Level1_Local_Prototype_v0_4.html`
- Original size: 41,134 bytes
- Original SHA-256: `c9799a7b1acdb1a3f646e1423deeca285b7016d58aab19f16f6da37d891ba1ef`

## Technical evidence versus acceptance
- JavaScript syntax and mocked-DOM logic harness are partial technical checks only.
- The logic harness reported 12/12 negative assertions and the positive simulated 80 kg / 15 kg remainder path.
- Chromium browser launch attempts did not produce rendered DOM output. No browser pass/fail is claimed.
- The complete 16 positive steps and 12 negative tests have not been executed by an operator in a supported browser.
- Independent review and sign-off remain pending.

## Open defects and stop conditions
DEF-L1-001 (negative controls could previously report PASS without executing the invalid action) and DEF-L1-002 (prototype v0.1 coverage was 8 workflow steps/6 controls versus 022's 16/12) remain OPEN pending controlled browser retest and independent review. Preserve original results and retest evidence; do not silently amend a failed/blocked result.
