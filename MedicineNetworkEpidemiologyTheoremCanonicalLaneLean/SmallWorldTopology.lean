import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure SmallWorldTopology where
  rewiringProbability : ℝ
  characteristicPathLength : ℕ
  clusteringCoeff : ℚ
  hasShortPaths : Prop
  highClustering : Prop

def SmallWorldClosed (S : SmallWorldTopology) : Prop := S.hasShortPaths ∧ S.highClustering

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse