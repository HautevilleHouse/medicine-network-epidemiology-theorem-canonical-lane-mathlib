import canonicalLaneMathlib.AdmissibleClass
import MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.SIRModel

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure BasicReproductionNumber {N : ContactNetwork} (M : SIRModel N) where
  r0 : ℝ
  spectralRadius : ℝ
  nextGenerationMatrix : Type u
  r0EqualsSpectralRadius : r0 = spectralRadius
  r0Nonneg : 0 ≤ r0
  spectralRadiusNonneg : 0 ≤ spectralRadius

structure BasicReproductionNumberEvidence {N : ContactNetwork} {M : SIRModel N} (R : BasicReproductionNumber M) where
  r0EqualsSpectralRadiusClosed : R.r0EqualsSpectralRadius
  r0NonnegClosed : R.r0Nonneg
  spectralRadiusNonnegClosed : R.spectralRadiusNonneg

def BasicReproductionNumberClosed {N : ContactNetwork} {M : SIRModel N} (R : BasicReproductionNumber M) : Prop :=
  R.r0EqualsSpectralRadius ∧ R.r0Nonneg ∧ R.spectralRadiusNonneg

theorem basic_reproduction_number_closed_from_evidence {N : ContactNetwork} {M : SIRModel N}
    (R : BasicReproductionNumber M) (E : BasicReproductionNumberEvidence R) :
    BasicReproductionNumberClosed R := by
  exact And.intro E.r0EqualsSpectralRadiusClosed
    (And.intro E.r0NonnegClosed E.spectralRadiusNonnegClosed)

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse