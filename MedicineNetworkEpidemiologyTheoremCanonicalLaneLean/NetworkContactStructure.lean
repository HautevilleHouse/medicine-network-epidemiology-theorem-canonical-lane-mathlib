import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure ContactNetwork where
  nodes : Type u
  edges : Type v
  edgeRelation : edges → nodes × nodes
  undirected : Prop
  finite : Prop
  degreeBounded : Nat
  undirectedTerm : undirected
  finiteTerm : finite
  degreeBoundedTerm : degreeBounded

structure ContactNetworkPackage (N : ContactNetwork) where
  graphSpectrum : Prop
  adjacencyMatrixSpectrum : Prop
  perronFrobeniusEigenvalue : Prop
  spectralRadius : Prop
  spectralGap : Prop

structure ContactNetworkEvidence (N : ContactNetwork) (P : ContactNetworkPackage N) where
  graphSpectrumClosed : P.graphSpectrum
  adjacencyMatrixSpectrumClosed : P.adjacencyMatrixSpectrum
  perronFrobeniusEigenvalueClosed : P.perronFrobeniusEigenvalue
  spectralRadiusClosed : P.spectralRadius
  spectralGapClosed : P.spectralGap

def ContactNetworkClosed (N : ContactNetwork) (P : ContactNetworkPackage N) : Prop :=
  P.graphSpectrum ∧ P.adjacencyMatrixSpectrum ∧ P.perronFrobeniusEigenvalue ∧ P.spectralRadius ∧ P.spectralGap

theorem contact_network_closed_from_evidence (N : ContactNetwork) (P : ContactNetworkPackage N) (E : ContactNetworkEvidence N P) : ContactNetworkClosed N P := by
  exact And.intro E.graphSpectrumClosed (And.intro E.adjacencyMatrixSpectrumClosed (And.intro E.perronFrobeniusEigenvalueClosed (And.intro E.spectralRadiusClosed E.spectralGapClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse