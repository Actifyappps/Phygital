# Secure development and supply-chain controls

## Engineering controls
- Review dependencies for maintenance, vulnerabilities, licence compatibility and transitive risk before adoption.
- Pin and reproducibly resolve dependencies; commit lockfiles when a package ecosystem is selected.
- Protect branch history and require review for sensitive changes when repository controls are available.
- Keep secrets out of source, fixtures, logs, screenshots, issue bodies and build artefacts.
- Use least-privilege tokens, short-lived credentials and separate identities for humans and automation.
- Scan dependencies, secrets, static code and container artefacts where relevant to the selected stack.
- Validate uploads, file types, content and storage access; scan files before trusted use.
- Apply server-side authorisation and tenant isolation; UI hiding is not security.
- Review SQL, migrations, policies, background jobs, webhooks and administrative paths as high-risk surfaces.
- Record build provenance, commit SHA, dependency state and test results for releases.

## Security verification
Threat-model changes before implementation; test both allowed and denied paths; verify tenant isolation, privilege escalation resistance, session/token revocation, audit integrity, rate limits, abuse handling, backup access and recovery. Do not claim certification or penetration-test completion without an actual scoped assessment and report.
