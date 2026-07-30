import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure NetworkContactGraph where
  nodeCount : Nat
  edgeSet : Set (Nat × Nat)
  adjacencyMatrix : Matrix (Fin nodeCount) (Fin nodeCount) Bool
  graphIsUndirected : ∀ i j, edgeSet (i, j) ↔ edgeSet (j, i)
  noSelfLoops : ∀ i, ¬ edgeSet (i, i)

structure ContactGraphEvidence (G : NetworkContactGraph) where
  nodeCountClosed : G.nodeCount > 0
  edgeSetNonempty : ¬ Set.Subsingleton G.edgeSet
  connectivityCondition : G.graphIsUndirected ∧ G.noSelfLoops

def ContactGraphClosed (G : NetworkContactGraph) : Prop :=
  G.nodeCount > 0 ∧ ¬ Set.Subsingleton G.edgeSet ∧ G.graphIsUndirected ∧ G.noSelfLoops

theorem contact_graph_closed_from_evidence (G : NetworkContactGraph) (E : ContactGraphEvidence G) : ContactGraphClosed G := by
  exact And.intro E.nodeCountClosed (And.intro E.edgeSetNonempty (And.intro E.connectivityCondition.1 E.connectivityCondition.2))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse