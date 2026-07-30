import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  population : Nat
  transmissionRate : ℝ
  recoveryRate : ℝ
  wellMixedAssumption : Prop
  homogeneousMixing : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  populationPositive : C.population > 0
  transmissionRateNonnegative : C.transmissionRate ≥ 0
  recoveryRateNonnegative : C.recoveryRate ≥ 0
  wellMixedAssumptionClosed : C.wellMixedAssumption
  homogeneousMixingClosed : C.homogeneousMixing

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.population > 0 ∧ C.transmissionRate ≥ 0 ∧ C.recoveryRate ≥ 0 ∧
  C.wellMixedAssumption ∧ C.homogeneousMixing

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.populationPositive
    (And.intro E.transmissionRateNonnegative
      (And.intro E.recoveryRateNonnegative
        (And.intro E.wellMixedAssumptionClosed E.homogeneousMixingClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse