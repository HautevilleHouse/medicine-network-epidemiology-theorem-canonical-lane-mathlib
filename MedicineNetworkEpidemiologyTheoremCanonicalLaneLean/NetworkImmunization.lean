import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure NetworkImmunization where
  targetFraction : ℚ
  immunizationEfficacy : ℚ
  herdImmunityThreshold : ℚ
  networkHerdImmunityAchieved : Prop

def NetworkImmunizationClosed (I : NetworkImmunization) : Prop := I.networkHerdImmunityAchieved

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse