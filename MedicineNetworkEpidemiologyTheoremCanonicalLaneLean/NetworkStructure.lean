import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure NetworkStructurePackage where
  nodeType : Type u
  edgeType : Type v
  degreeDistribution : List Nat
  clusteringCoefficient : ℝ
  averagePathLength : ℝ
  smallWorldProperty : Prop
  scaleFreeProperty : Prop

structure NetworkStructureEvidence (N : NetworkStructurePackage) where
  degreeDistributionNonempty : N.degreeDistribution ≠ []
  clusteringCoefficientBetween01 : 0 ≤ N.clusteringCoefficient ∧ N.clusteringCoefficient ≤ 1
  averagePathLengthFinite : N.averagePathLength < ⊤
  smallWorldPropertyClosed : N.smallWorldProperty
  scaleFreePropertyClosed : N.scaleFreeProperty

def NetworkStructureClosed (N : NetworkStructurePackage) : Prop :=
  N.degreeDistribution ≠ [] ∧ 0 ≤ N.clusteringCoefficient ∧ N.clusteringCoefficient ≤ 1 ∧
  N.averagePathLength < ⊤ ∧ N.smallWorldProperty ∧ N.scaleFreeProperty

theorem network_structure_closed_from_evidence (N : NetworkStructurePackage)
    (E : NetworkStructureEvidence N) : NetworkStructureClosed N := by
  have h_cc : 0 ≤ N.clusteringCoefficient ∧ N.clusteringCoefficient ≤ 1 :=
    E.clusteringCoefficientBetween01
  exact And.intro E.degreeDistributionNonempty
    (And.intro h_cc.1
      (And.intro h_cc.2
        (And.intro E.averagePathLengthFinite
          (And.intro E.smallWorldPropertyClosed E.scaleFreePropertyClosed))))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse