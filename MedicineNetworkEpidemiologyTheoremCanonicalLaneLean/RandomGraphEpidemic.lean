import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure RandomGraphEpidemic where
  graphModel : String
  averageDegree : ℚ
  epidemicThreshold : ℚ
  outbreakProbability : ℝ
  giantComponentSize : ℕ

def RandomGraphEpidemicClosed (R : RandomGraphEpidemic) : Prop := R.outbreakProbability > 0.5

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse