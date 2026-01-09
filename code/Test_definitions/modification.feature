Feature: Modification of MultiPoint VPN

  Background:
    Given I am authenticated with scope "vpn:write"

  @Scale_bandwidth_1000
  Scenario: Scale up bandwidth
    Given a VPN with vpnId in status "active" and bandwidth "500 Mbps"
    When I PATCH "/vpns/{vpnId}" to set bandwidth "1000 Mbps"
    Then the status transitions to "reconfiguring" and then "active"

  @SLA_upgrade_AAA
  Scenario: SLA upgrade
    Given a VPN with SLA "AA"
    When I PATCH "/vpns/{vpnId}" to SLA "AAA"
    Then the response indicates reassessment or acceptance based on policy
