#!/bin/bash

# CircleCI token should be set with command `circleci auth login`
circleci config pack src > orb.yml
circleci orb publish orb.yml aursu/rpmbuild@dev:alpha
rm -rf orb.yml
