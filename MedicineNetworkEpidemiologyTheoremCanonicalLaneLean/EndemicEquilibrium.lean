import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.SIRCompartmentModel

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure EndemicEquilibrium (M : SIRCompartmentModel) where
  endemicInfected : ℕ
  endemicSusceptible : ℕ
  equilibriumCondition : endemicInfected > 0
  stabilityProperty : Prop

structure EndemicEquilibriumEvidence (M : SIRCompartmentModel) (E : EndemicEquilibrium M) where
  infectedPositive : E.endemicInfected > 0
  stabilityCondition : E.stabilityProperty

def EndemicEquilibriumClosed (M : SIRCompartmentModel) (E : EndemicEquilibrium M) : Prop :=
  E.endemicInfected > 0 ∧ E.stabilityProperty

theorem endemic_equilibrium_closed_from_evidence (M : SIRCompartmentModel) (E : EndemicEquilibrium M) (Ev : EndemicEquilibriumEvidence M E) : EndemicEquilibriumClosed M E := by
  exact And.intro Ev.infectedPositive Ev.stabilityCondition

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse