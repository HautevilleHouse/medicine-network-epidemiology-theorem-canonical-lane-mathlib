import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.NetworkContactStructure

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure SmallWorldModel (N : ContactNetwork) where
  rewiringProbability : ℝ
  clusteringCoefficient : Prop
  averagePathLength : Prop
  clusteringHigh : Prop
  pathLengthShort : Prop
  clusteringHighTerm : clusteringHigh
  pathLengthShortTerm : pathLengthShort

structure SmallWorldEpidemicSpreadPackage (N : ContactNetwork) (S : SmallWorldModel N) where
  sirEpidemicThreshold : Prop
  epidemicSizeDistribution : Prop
  outbreakProbability : Prop
  spatialHeterogeneity : Prop
  timeToPeak : Prop

structure SmallWorldEpidemicSpreadEvidence (N : ContactNetwork) (S : SmallWorldModel N) (P : SmallWorldEpidemicSpreadPackage N S) where
  sirEpidemicThresholdClosed : P.sirEpidemicThreshold
  epidemicSizeDistributionClosed : P.epidemicSizeDistribution
  outbreakProbabilityClosed : P.outbreakProbability
  spatialHeterogeneityClosed : P.spatialHeterogeneity
  timeToPeakClosed : P.timeToPeak

def SmallWorldEpidemicSpreadClosed (N : ContactNetwork) (S : SmallWorldModel N) (P : SmallWorldEpidemicSpreadPackage N S) : Prop :=
  P.sirEpidemicThreshold ∧ P.epidemicSizeDistribution ∧ P.outbreakProbability ∧ P.spatialHeterogeneity ∧ P.timeToPeak

theorem small_world_epidemic_spread_closed_from_evidence (N : ContactNetwork) (S : SmallWorldModel N) (P : SmallWorldEpidemicSpreadPackage N S) (E : SmallWorldEpidemicSpreadEvidence N S P) : SmallWorldEpidemicSpreadClosed N S P := by
  exact And.intro E.sirEpidemicThresholdClosed (And.intro E.epidemicSizeDistributionClosed (And.intro E.outbreakProbabilityClosed (And.intro E.spatialHeterogeneityClosed E.timeToPeakClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse