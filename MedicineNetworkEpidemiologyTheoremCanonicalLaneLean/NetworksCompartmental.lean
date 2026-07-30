import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure CompartmentalModel where
  susceptible : Type u
  infected : Type v
  removed : Type w
  transmissionCoefficient : ℝ
  recoveryCoefficient : ℝ
  vaccinationRate : ℝ

def CompartmentalModelClosed (M : CompartmentalModel) : Prop :=
  M.transmissionCoefficient > 0 ∧ M.recoveryCoefficient > 0

structure CompartmentalEvidence (M : CompartmentalModel) where
  transmissionStable : M.transmissionCoefficient > 0
  recoveryStable : M.recoveryCoefficient > 0

theorem compartmental_closed_from_evidence (M : CompartmentalModel) (E : CompartmentalEvidence M) :
    CompartmentalModelClosed M :=
  And.intro E.transmissionStable E.recoveryStable

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse