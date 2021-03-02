# How to automate tests using ixia and contribute to sonic-mgmt

This document intends to achieve the following
  - Ways to automate tests with ixia
  - Guidelines around test file organization
  - How to raise pull requests to sonic-mgmt repo

## Automate tests with ixia
There are two ways to automate tests with ixia
1) using `snappi`(python library) that conforms to open-traffic-generator models.
2) using `ixnetwork-restpy`(python library) a client side script development tool maps to IxNetwork API tree.

## Test file organization
Before writing the tests, make sure the testbed is updated properly as per workflow mentioned here
https://github.com/ANISH-GOTTAPU/sonic-testbed-manager

1) using `snappi`
    - The `snappi_api` fixture is available in ixia_fixtures.
```
tests
  |_ common
     |_ixia
        |_ixia_fixtures.py
        |_ixia_helpers.py
  |_ ixia
     |_bgp
      |_ test_bgp_community.py
      |_ files
           |_ all helpers for the bgp feature
```

2) using `ixnetwork-restpy`
     - The `ixia_api` fixture is available in ixia_fixtures.
     - Any new API related to ixia can be added as part of ixia_helpers.
```
tests
  |_ common
     |_ixia
        |_ixia_fixtures.py
        |_ixia_helpers.py
  |_ ixia
     |_bgp
      |_ test_bgp_community.py
      |_ files
           |_ all helpers for the bgp feature
```

## Raise pull requests to sonic-mgmt
* Each developer should fork this repository and [add the team as a Contributor](https://help.github.com/articles/adding-collaborators-to-a-personal-repository)
* Push your changes to your private fork and do "pull-request" to this repository
* Use a pull request to do code review
* Use issues to keep track of what is going on