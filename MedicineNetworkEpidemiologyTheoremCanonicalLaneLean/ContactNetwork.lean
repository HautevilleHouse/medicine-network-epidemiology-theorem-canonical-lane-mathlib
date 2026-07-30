import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure ContactNetwork where
  population : Type u
  edges : population → population → Prop
  symmetric : Prop
  irrefl : Prop
  degreeBounded : Prop
  symmetricTerm : symmetric
  irreflTerm : irrefl
  degreeBoundedTerm : degreeBounded

structure ContactNetworkEvidence (N : ContactNetwork) where
  symmetricClosed : N.symmetric
  irreflClosed : N.irrefl
  degreeBoundedClosed : N.degreeBounded

def ContactNetworkClosed (N : ContactNetwork) : Prop :=
  N.symmetric ∧ N.irrefl ∧ N.degreeBounded

theorem contact_network_closed_from_evidence (N : ContactNetwork) (E : ContactNetworkEvidence N) :
    ContactNetworkClosed N := by
  exact And.intro E.symmetricClosed (And.intro E.irreflClosed E.degreeBoundedClosed)

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse