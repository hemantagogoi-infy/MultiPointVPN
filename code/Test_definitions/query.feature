Feature: Query MultiPoint VPN details

  Background:
    Given I am authenticated with scope "vpn:read"

  @Get_VPN_ID
  Scenario: Get VPN by ID
    When I GET "/vpns/{vpnId}"
    Then the response includes SLA, bandwidth, topology, nodes, and lifecycle state

  @VPNs_filters_active
  Scenario: List VPNs with filters
    When I GET "/vpns?status=active&tenantId=..."
    Then the response includes paginated results with total count
