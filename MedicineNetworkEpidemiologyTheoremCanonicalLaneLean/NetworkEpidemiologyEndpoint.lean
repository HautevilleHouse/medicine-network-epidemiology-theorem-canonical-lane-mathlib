import canonicalLaneMathlib.AdmissibleClass
import MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.EpidemicThreshold

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure NetworkEpidemiologyEndpoint {N : ContactNetwork} {M : SIRModel N} {R : BasicReproductionNumber M}
    (T : EpidemicThreshold R) where
  extinctionThresholdCondition : ℕ → Prop
  endemicThresholdCondition : ℕ → Prop
  extinctionThresholdOk : extinctionThresholdCondition 0
  endemicThresholdOk : endemicThresholdCondition 1

structure NetworkEpidemiologyEndpointEvidence {N : ContactNetwork} {M : SIRModel N} {R : BasicReproductionNumber M}
    {T : EpidemicThreshold R} (E : NetworkEpidemiologyEndpoint T) where
  extinctionThresholdOkClosed : E.extinctionThresholdOk
  endemicThresholdOkClosed : E.endemicThresholdOk

def NetworkEpidemiologyEndpointClosed {N : ContactNetwork} {M : SIRModel N} {R : BasicReproductionNumber M}
    {T : EpidemicThreshold R} (E : NetworkEpidemiologyEndpoint T) : Prop :=
  E.extinctionThresholdOk ∧ E.endemicThresholdOk

theorem network_epidemiology_endpoint_closed_from_evidence
    {N : ContactNetwork} {M : SIRModel N} {R : BasicReproductionNumber M} {T : EpidemicThreshold R}
    (E : NetworkEpidemiologyEndpoint T) (Ev : NetworkEpidemiologyEndpointEvidence E) :
    NetworkEpidemiologyEndpointClosed E := by
  exact And.intro Ev.extinctionThresholdOkClosed Ev.endemicThresholdOkClosed

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse