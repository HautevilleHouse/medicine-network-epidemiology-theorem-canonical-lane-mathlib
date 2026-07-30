import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.NetworkContactStructure

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure ImmunizationStrategy (N : ContactNetwork) where
  targetedImmunization : Prop
  acquaintanceImmunization : Prop
  randomImmunization : Prop
  heuristicEffectiveness : Prop
  optimalAllocation : Prop
  targetedImmunizationTerm : targetedImmunization
  acquaintanceImmunizationTerm : acquaintanceImmunization
  randomImmunizationTerm : randomImmunization

structure NetworkImmunizationImpactPackage (N : ContactNetwork) (I : ImmunizationStrategy N) where
  herdImmunityThreshold : Prop
  immunizationCoverageRequired : Prop
  networkStructureImpact : Prop
  effectivenessComparison : Prop
  costConstraint : Prop

structure NetworkImmunizationImpactEvidence (N : ContactNetwork) (I : ImmunizationStrategy N) (P : NetworkImmunizationImpactPackage N I) where
  herdImmunityThresholdClosed : P.herdImmunityThreshold
  immunizationCoverageRequiredClosed : P.immunizationCoverageRequired
  networkStructureImpactClosed : P.networkStructureImpact
  effectivenessComparisonClosed : P.effectivenessComparison
  costConstraintClosed : P.costConstraint

def NetworkImmunizationImpactClosed (N : ContactNetwork) (I : ImmunizationStrategy N) (P : NetworkImmunizationImpactPackage N I) : Prop :=
  P.herdImmunityThreshold ∧ P.immunizationCoverageRequired ∧ P.networkStructureImpact ∧ P.effectivenessComparison ∧ P.costConstraint

theorem network_immunization_impact_closed_from_evidence (N : ContactNetwork) (I : ImmunizationStrategy N) (P : NetworkImmunizationImpactPackage N I) (E : NetworkImmunizationImpactEvidence N I P) : NetworkImmunizationImpactClosed N I P := by
  exact And.intro E.herdImmunityThresholdClosed (And.intro E.immunizationCoverageRequiredClosed (And.intro E.networkStructureImpactClosed (And.intro E.effectivenessComparisonClosed E.costConstraintClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse