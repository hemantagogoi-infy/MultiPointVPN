Feature: Deletion of MultiPoint VPN

  Background:
    Given I am authenticated with scope "vpn:write"

  Scenario: Terminate active VPN
    Given a VPN in status "active"
    When I DELETE "/vpns/{vpnId}"
    Then the status transitions to "terminating" and then "deleted"

  Scenario: Delete non-existent VPN
    When I DELETE "/vpns/{badId}"
    Then I receive 404 Not Found
