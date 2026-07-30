import canonicalLaneMathlib.AdmissibleClass
import MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.ContactNetwork

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure SIRModel (N : ContactNetwork) where
  susceptible : N.population → Prop
  infected : N.population → Prop
  recovered : N.population → Prop
  transmissionRate : ℝ
  recoveryRate : ℝ
  disjointSusceptibleInfected : ∀ x, susceptible x → ¬ infected x
  disjointInfectedRecovered : ∀ x, infected x → ¬ recovered x
  disjointSusceptibleRecovered : ∀ x, susceptible x → ¬ recovered x
  transmissionRateNonneg : 0 ≤ transmissionRate
  recoveryRateNonneg : 0 ≤ recoveryRate

structure SIRModelEvidence {N : ContactNetwork} (M : SIRModel N) where
  disjointSusceptibleInfectedClosed : M.disjointSusceptibleInfected
  disjointInfectedRecoveredClosed : M.disjointInfectedRecovered
  disjointSusceptibleRecoveredClosed : M.disjointSusceptibleRecovered
  transmissionRateNonnegClosed : M.transmissionRateNonneg
  recoveryRateNonnegClosed : M.recoveryRateNonneg

def SIRModelClosed {N : ContactNetwork} (M : SIRModel N) : Prop :=
  M.disjointSusceptibleInfected ∧ M.disjointInfectedRecovered ∧
  M.disjointSusceptibleRecovered ∧ M.transmissionRateNonneg ∧ M.recoveryRateNonneg

theorem sir_model_closed_from_evidence {N : ContactNetwork} (M : SIRModel N) (E : SIRModelEvidence M) :
    SIRModelClosed M := by
  exact And.intro E.disjointSusceptibleInfectedClosed
    (And.intro E.disjointInfectedRecoveredClosed
      (And.intro E.disjointSusceptibleRecoveredClosed
        (And.intro E.transmissionRateNonnegClosed E.recoveryRateNonnegClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse