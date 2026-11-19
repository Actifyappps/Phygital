# 024-D candidate domain event catalogue

**Status:** proposed event vocabulary, not a selected transport, schema registry or deployed event bus. Events describe committed facts, not commands. Rejected commands must not emit success events as though the business fact occurred.

## Candidate event families

### Identity and authority
- OrganisationRegistered
- MembershipActivated / MembershipSuspended / MembershipRevoked
- RoleGrantAssigned / RoleGrantRevoked
- AuthorityEvidenceSubmitted
- SellerCapacityApproved / SellerCapacitySuspended / SellerCapacityRevoked
- ExporterCapacityApproved / ExporterCapacitySuspended / ExporterCapacityRevoked

### Product, rules and supply
- ProductDefinitionVersioned
- CommodityRulePublished / CommodityRuleSuperseded
- SupplyDeclarationSubmitted
- HubServiceRecorded
- BatchCreated
- MeasurementRecorded
- EvidenceSubmitted / EvidenceReviewed / EvidenceRevoked
- BatchHeld / BatchEligibilityApproved / BatchRejected

### Marketplace and commercial
- ListingDraftCreated / ListingPublished / ListingPaused / ListingWithdrawn
- ListingBatchBackingAdded / ListingBatchBackingRemoved
- BuyerEnquirySubmitted / BuyerQualified
- CompatibilityAssessmentCompleted
- QuotationIssued / QuotationRevised / QuotationAccepted / QuotationRejected / QuotationExpired
- OrderCreated / OrderVaried / OrderCancelled

### Reservation, movement and fulfilment
- ReservationCreated / ReservationReleased / ReservationExpired
- PhysicalMovementRecorded / InventoryDiscrepancyRecorded
- PackingRecorded / ShipmentMilestoneRecorded
- ShipmentExceptionOpened / DeliveryEvidenceRecorded

### Payment status and cases
- PaymentInstructionRecorded
- ProviderPaymentEventReceived
- PaymentStatusNormalized
- PaymentReconciliationCompleted / PaymentExceptionOpened
- ComplaintSubmitted / CaseOpened / CaseDecisionRecorded / AppealSubmitted / AppealResolved
- ProductHoldIssued / RecallOpened / RecallScopeExpanded / RecallClosed

### Operations and governance
- OfflineActionReceived / OfflineActionAccepted / OfflineActionRejected / OfflineConflictDetected
- SecurityIncidentOpened / SupportCaseAssigned / SupportCaseResolved
- PilotGateEvaluated / PilotGateDecisionRecorded
- CommercialServiceVersionApproved / CommercialServiceVersionRetired

## Minimum event envelope
Event ID/type; schema version; occurred-at and recorded-at; aggregate/resource ID and version; actor/service identity and organisation scope; correlation and causation IDs; source system/device/provider; evidence references and classification where needed; privacy classification and permitted-consumer scope.

## Delivery and replay requirements
Document at-least-once vs exactly-once claims; per-resource ordering/version checks; duplicate detection and consumer idempotency; retry/backoff; dead-letter and poison-message quarantine; controlled replay; schema compatibility; event retention and access controls; reconciliation for missed/delayed/out-of-order events. Never assume end-to-end exactly-once delivery.

A replay must not create a second order, reservation, movement, payment confirmation or case action. Provider-specific fields stay behind replaceable adapters.
