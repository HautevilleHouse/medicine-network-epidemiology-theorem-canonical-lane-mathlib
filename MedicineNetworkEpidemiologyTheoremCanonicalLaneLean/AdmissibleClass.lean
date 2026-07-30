import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : EpidemiologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EpidemiologyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
