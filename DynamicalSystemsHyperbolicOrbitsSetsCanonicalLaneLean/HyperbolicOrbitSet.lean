import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicOrbitSet where
  flow : Type u
  invariantSet : Type v
  hyperbolicStructure : Prop
  stableUnstableBundlesDefined : Prop
  shadowingProperty : Prop
  closingLemmaHolds : Prop

structure HyperbolicOrbitSetEvidence (H : HyperbolicOrbitSet) where
  hyperbolicStructureClosed : H.hyperbolicStructure
  stableUnstableBundlesDefinedClosed : H.stableUnstableBundlesDefined
  shadowingPropertyClosed : H.shadowingProperty
  closingLemmaHoldsClosed : H.closingLemmaHolds

def HyperbolicOrbitSetClosed (H : HyperbolicOrbitSet) : Prop :=
  H.hyperbolicStructure ∧ H.stableUnstableBundlesDefined ∧
  H.shadowingProperty ∧ H.closingLemmaHolds

theorem hyperbolic_orbit_set_closed_from_evidence (H : HyperbolicOrbitSet) (E : HyperbolicOrbitSetEvidence H) :
    HyperbolicOrbitSetClosed H := by
  exact And.intro E.hyperbolicStructureClosed
    (And.intro E.stableUnstableBundlesDefinedClosed
      (And.intro E.shadowingPropertyClosed E.closingLemmaHoldsClosed))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse