import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure SIREpidemicModel where
  susceptibleCount : ℕ 
  infectedCount : ℕ
  recoveredCount : ℕ
  transmissionRate : ℚ
  recoveryRate : ℚ
  basicReproNumber : ℚ

def SIRModelClosed (M : SIREpidemicModel) : Prop := M.basicReproNumber > 0

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse