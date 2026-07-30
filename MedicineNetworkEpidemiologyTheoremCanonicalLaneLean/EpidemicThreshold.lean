import canonicalLaneMathlib.AdmissibleClass
import MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.BasicReproductionNumber

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure EpidemicThreshold {N : ContactNetwork} {M : SIRModel N} (R : BasicReproductionNumber M) where
  thresholdValue : ℝ
  largePopulationLimit : Prop
  thresholdAboveOneImplyEndemic : thresholdValue > 1 → Prop
  thresholdBelowOneImplyExtinction : thresholdValue < 1 → Prop

structure EpidemicThresholdEvidence {N : ContactNetwork} {M : SIRModel N} {R : BasicReproductionNumber M}
    (T : EpidemicThreshold R) where
  largePopulationLimitClosed : T.largePopulationLimit
  thresholdAboveOneImplyEndemicClosed : T.thresholdAboveOneImplyEndemic
  thresholdBelowOneImplyExtinctionClosed : T.thresholdBelowOneImplyExtinction

def EpidemicThresholdClosed {N : ContactNetwork} {M : SIRModel N} {R : BasicReproductionNumber M}
    (T : EpidemicThreshold R) : Prop :=
  T.largePopulationLimit ∧ T.thresholdAboveOneImplyEndemic ∧ T.thresholdBelowOneImplyExtinction

theorem epidemic_threshold_closed_from_evidence {N : ContactNetwork} {M : SIRModel N} {R : BasicReproductionNumber M}
    (T : EpidemicThreshold R) (E : EpidemicThresholdEvidence T) :
    EpidemicThresholdClosed T := by
  exact And.intro E.largePopulationLimitClosed
    (And.intro E.thresholdAboveOneImplyEndemicClosed E.thresholdBelowOneImplyExtinctionClosed)

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse