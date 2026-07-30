import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure NetworkEpidemiologyModel where
  contactNetwork : Type u
  infectionState : Type v
  transmissionRate : ℕ → ℕ → ℝ
  recoveryRate : ℝ
  basicReproductiveNumber : ℝ

def networkEpidemiologyClosed (M : NetworkEpidemiologyModel) : Prop :=
  M.basicReproductiveNumber > 0 ∧ M.recoveryRate > 0

structure NetworkEpidemiologyPackage where
  model : NetworkEpidemiologyModel
  thresholdCondition : Prop
  epidemicThresholdEvidence : thresholdCondition

def NetworkEpidemiologyAdmissibleClass (P : NetworkEpidemiologyPackage) : AdmissibleClass :=
  { object := { carrier := P.model.contactNetwork, endpointSatisfied := P.thresholdCondition, remainderRecorded := False },
    endpointSatisfied := P.thresholdCondition,
    remainderRecorded := False,
    gateWitness := Or.inl P.thresholdCondition
  }

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse