Feature: Assessment of MultiPoint VPN availability

  Background:
    Given I am authenticated with scope "vpn:write"

  @single_site_assessment_completed
  Scenario: Successful single site assessment
    Given a valid tenant and one access node
    When I POST "/assessments" with SLA "AA", bandwidth "500 Mbps", and duration "30 days"
    Then the response includes availabilityLevel, estimatedFees, assessmentId, and status "completed"

  @Assessment_with_multiple_nodes_available
  Scenario: Assessment with multiple nodes
    Given multiple sites including DC, branch, and cloud region
    When I POST "/assessments" with SLA "AAA" and bandwidth "1 Gbps"
    Then the response includes composite feasibility and per-site availability

  @SLA_tier_invalid
  Scenario: Invalid SLA tier
    When I POST "/assessments" with SLA "AAAA"
    Then I receive 400 with error.code "invalid_sla_tier"
