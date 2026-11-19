# rpmbuild-orb [![CircleCI](https://circleci.com/gh/aursu/rpmbuild-orb/tree/master.svg?style=svg)](https://circleci.com/gh/aursu/rpmbuild-orb/tree/master) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/aursu/rpmbuild)](https://circleci.com/orbs/registry/orb/aursu/rpmbuild)

aursu/rpmbuild CircleCI Orb

## Usage

_For full usage guidelines, see the [orb registry listing](http://circleci.com/orbs/registry/orb/aursu/rpmbuild)._


## Releasing

A push to `master` publishes `aursu/rpmbuild@dev:alpha`, then
`orb-tools/dev-promote-prod-from-commit-subject` promotes it to a production
version. The promotion reads the subject of the **head commit on `master`**:

- `[semver:patch]`, `[semver:minor]` or `[semver:major]` in the subject picks
  the version bump;
- no tag in the subject fails the job (`fail-if-semver-not-indicated: true`),
  and nothing is released.

A pull request must therefore land with the tag in the head commit subject:
merge it with **Squash and merge** (the PR title becomes the subject, so put
the tag there) or **Rebase and merge** (each commit keeps its own subject).
**Create a merge commit** produces `Merge pull request #…` and releases nothing.

Publishing needs a valid CircleCI API token in the project settings; an
expired token fails `orb-tools/publish-dev` before any promotion runs.

The executor in `src/executors/default.yml` pins the OS image versions
(`RL*`, `OS*`). A consumer's `.env` does not override them, so an OS bump in
the image repositories takes effect only after a new orb release and a bump of
the orb version in each consumer's `.circleci/config.yml`.
