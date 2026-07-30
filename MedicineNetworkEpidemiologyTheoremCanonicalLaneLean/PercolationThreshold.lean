import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.NetworkContactStructure

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure PercolationThresholdPackage (N : ContactNetwork) (P : ContactNetworkPackage N) where
  bondPercolationThreshold : Prop
  sitePercolationThreshold : Prop
  clusterDistribution : Prop
  giantComponentExistence : Prop
  percolationCriticalExponent : Prop

structure PercolationThresholdEvidence (N : ContactNetwork) (P : ContactNetworkPackage N) (Q : PercolationThresholdPackage N P) where
  bondPercolationThresholdClosed : Q.bondPercolationThreshold
  sitePercolationThresholdClosed : Q.sitePercolationThreshold
  clusterDistributionClosed : Q.clusterDistribution
  giantComponentExistenceClosed : Q.giantComponentExistence
  percolationCriticalExponentClosed : Q.percolationCriticalExponent

def PercolationThresholdClosed (N : ContactNetwork) (P : ContactNetworkPackage N) (Q : PercolationThresholdPackage N P) : Prop :=
  Q.bondPercolationThreshold ∧ Q.sitePercolationThreshold ∧ Q.clusterDistribution ∧ Q.giantComponentExistence ∧ Q.percolationCriticalExponent

theorem percolation_threshold_closed_from_evidence (N : ContactNetwork) (P : ContactNetworkPackage N) (Q : PercolationThresholdPackage N P) (E : PercolationThresholdEvidence N P Q) : PercolationThresholdClosed N P Q := by
  exact And.intro E.bondPercolationThresholdClosed (And.intro E.sitePercolationThresholdClosed (And.intro E.clusterDistributionClosed (And.intro E.giantComponentExistenceClosed E.percolationCriticalExponentClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse