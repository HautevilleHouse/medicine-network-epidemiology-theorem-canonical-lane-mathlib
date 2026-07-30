import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.NetworkContactStructure

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure RandomGraphModel (N : ContactNetwork) where
  edgeProbability : ℝ
  poissonDegreeDistribution : Prop
  giantComponentThreshold : Prop
  degreeDistributionPoisson : Prop
  giantComponentExists : Prop
  degreeDistributionPoissonTerm : degreeDistributionPoisson
  giantComponentExistsTerm : giantComponentExists

structure RandomGraphEpidemicThresholdPackage (N : ContactNetwork) (R : RandomGraphModel N) where
  basicReproductionNumber : Prop
  epidemicThresholdCondition : Prop
  networkSizeScaling : Prop
  degreeDistributionMoments : Prop
  branchingProcessApproximation : Prop

structure RandomGraphEpidemicThresholdEvidence (N : ContactNetwork) (R : RandomGraphModel N) (P : RandomGraphEpidemicThresholdPackage N R) where
  basicReproductionNumberClosed : P.basicReproductionNumber
  epidemicThresholdConditionClosed : P.epidemicThresholdCondition
  networkSizeScalingClosed : P.networkSizeScaling
  degreeDistributionMomentsClosed : P.degreeDistributionMoments
  branchingProcessApproximationClosed : P.branchingProcessApproximation

def RandomGraphEpidemicThresholdClosed (N : ContactNetwork) (R : RandomGraphModel N) (P : RandomGraphEpidemicThresholdPackage N R) : Prop :=
  P.basicReproductionNumber ∧ P.epidemicThresholdCondition ∧ P.networkSizeScaling ∧ P.degreeDistributionMoments ∧ P.branchingProcessApproximation

theorem random_graph_epidemic_threshold_closed_from_evidence (N : ContactNetwork) (R : RandomGraphModel N) (P : RandomGraphEpidemicThresholdPackage N R) (E : RandomGraphEpidemicThresholdEvidence N R P) : RandomGraphEpidemicThresholdClosed N R P := by
  exact And.intro E.basicReproductionNumberClosed (And.intro E.epidemicThresholdConditionClosed (And.intro E.networkSizeScalingClosed (And.intro E.degreeDistributionMomentsClosed E.branchingProcessApproximationClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse