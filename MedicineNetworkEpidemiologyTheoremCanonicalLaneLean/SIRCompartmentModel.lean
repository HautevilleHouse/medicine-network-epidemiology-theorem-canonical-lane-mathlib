import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure SIRCompartmentModel where
  susceptibleCount : Nat
  infectedCount : Nat
  recoveredCount : Nat
  totalPopulation : Nat
  transmissionRate : ℝ
  recoveryRate : ℝ
  initialConditionsConsistent : susceptibleCount + infectedCount + recoveredCount = totalPopulation

structure SIRModelEvidence (M : SIRCompartmentModel) where
  transmissionPositive : M.transmissionRate > 0
  recoveryPositive : M.recoveryRate > 0
  populationConsistent : M.susceptibleCount + M.infectedCount + M.recoveredCount = M.totalPopulation

def SIRModelClosed (M : SIRCompartmentModel) : Prop :=
  M.transmissionRate > 0 ∧ M.recoveryRate > 0 ∧ M.susceptibleCount + M.infectedCount + M.recoveredCount = M.totalPopulation

theorem sir_model_closed_from_evidence (M : SIRCompartmentModel) (E : SIRModelEvidence M) : SIRModelClosed M := by
  exact And.intro E.transmissionPositive (And.intro E.recoveryPositive E.populationConsistent)

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse