import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure EpidemicSpreadPackage where
  basicReproductionNumber : ℝ
  finalEpidemicSize : ℝ
  epidemicThreshold : ℝ
  herdImmunityLevel : ℝ
  outbreakProbability : ℝ
  networkStructure : NetworkStructurePackage
  compartmentModel : CompartmentModelPackage

structure EpidemicSpreadEvidence (E : EpidemicSpreadPackage) where
  basicReproductionNumberPositive : E.basicReproductionNumber > 0
  finalEpidemicSizeNonnegative : E.finalEpidemicSize ≥ 0
  epidemicThresholdValid : 0 < E.epidemicThreshold ∧ E.epidemicThreshold < 1
  herdImmunityLevelBetween01 : 0 ≤ E.herdImmunityLevel ∧ E.herdImmunityLevel ≤ 1
  outbreakProbabilityBetween01 : 0 ≤ E.outbreakProbability ∧ E.outbreakProbability ≤ 1

def EpidemicSpreadClosed (E : EpidemicSpreadPackage) : Prop :=
  E.basicReproductionNumber > 0 ∧ E.finalEpidemicSize ≥ 0 ∧
  0 < E.epidemicThreshold ∧ E.epidemicThreshold < 1 ∧
  0 ≤ E.herdImmunityLevel ∧ E.herdImmunityLevel ≤ 1 ∧
  0 ≤ E.outbreakProbability ∧ E.outbreakProbability ≤ 1

theorem epidemic_spread_closed_from_evidence (E : EpidemicSpreadPackage)
    (Ev : EpidemicSpreadEvidence E) : EpidemicSpreadClosed E := by
  have h_th : 0 < E.epidemicThreshold ∧ E.epidemicThreshold < 1 := Ev.epidemicThresholdValid
  have h_hi : 0 ≤ E.herdImmunityLevel ∧ E.herdImmunityLevel ≤ 1 := Ev.herdImmunityLevelBetween01
  have h_op : 0 ≤ E.outbreakProbability ∧ E.outbreakProbability ≤ 1 := Ev.outbreakProbabilityBetween01
  exact And.intro Ev.basicReproductionNumberPositive
    (And.intro Ev.finalEpidemicSizeNonnegative
      (And.intro h_th.1 (And.intro h_th.2
        (And.intro h_hi.1 (And.intro h_hi.2
          (And.intro h_op.1 h_op.2))))))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse