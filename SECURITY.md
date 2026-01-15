# Security Policy

## Supported Versions

- The `master` branch is the only branch that receives security fixes.
- Docs and samples under `ruby-on-rails/`, `ruby/`, and `python/` are intended to be consumed from the latest commit. Older tags are not maintained.

## Ecosystem & Compatibility

| Stack / Component        | Version(s) / Tooling           | Notes |
| ------------------------ | ------------------------------ | ----- |
| OS baseline              | WSL (Ubuntu 24.04.3 LTS)       | Matches the environment described in the docs section. |
| Ruby on Rails exercises  | Ruby 4.0.1 (`.ruby-version`)   | Bundler-managed gems per sample app; keep Rails/Botpress gems current. |
| Ruby CLI helpers         | Ruby 4.0.1                     | Depend only on the Ruby standard library. |
| Python automation        | CPython 3.14.2 (`.python-version`) | Scripts currently rely on the Python standard library; add new packages via per-folder requirements if needed. |

## Backward Compatibility

- Tutorials strive to keep helper scripts backward compatible across the same major runtime line (Ruby 4.0.x, Python 3.14.x). Breaking changes are announced in the docs prior to release.
- Older majors (Ruby 3.x, Python 3.13 and below) and historical tags are not patched; please upgrade to the versions listed above before reporting.

## Reporting a Vulnerability

Please report vulnerabilities privately so we can triage before disclosure:

1. **Preferred:** Open a private GitHub Security Advisory via the repository’s
	**Security → Report a vulnerability** workflow.
2. **Alternate:** Email the maintainers at `security@project.org` with a short
	summary, reproduction steps, affected components, and suggested mitigations.

We aim to acknowledge new reports within **3 business days** and provide status updates at least every **7 business days** while we investigate.  
Once a fix is ready we will coordinate release timing and, if desired, credit you in the advisory.  
If a report is deemed out of scope, we will explain why.
