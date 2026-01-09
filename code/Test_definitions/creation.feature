Feature: Creation of MultiPoint VPN

  Background:
    Given I am authenticated with scope "vpn:write"

  Scenario: Create VPN from assessment
    Given an assessment with SLA "AA", bandwidth "1000 Mbps", duration "90 days", and 3 nodes
    When I POST "/vpns" with the assessmentId and topology "hub-and-spoke"
    Then I receive 201 with a vpnId and status "provisioning"

  Scenario: Idempotent VPN creation
    Given I have a valid request body for VPN creation
    When I retry POST "/vpns" with the same x-idempotency-key
    Then I receive the same vpnId without duplicating orders
