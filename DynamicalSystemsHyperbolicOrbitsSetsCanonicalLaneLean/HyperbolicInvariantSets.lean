import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.AdmissibleClass

/-!
# Hyperbolic Invariant Sets Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicInvariantSetsPackage {M : Type} [TopologicalSpace M] {f : M → M} where
  invariantSet : Set M
  hyperbolicStructure : Prop
  stableManifold : Prop
  unstableManifold : Prop
  shadowingProperty : Prop

structure HyperbolicInvariantSetsEvidence {M : Type} [TopologicalSpace M] {f : M → M}
    (H : HyperbolicInvariantSetsPackage M f) where
  invariantSetClosed : H.invariantSet
  hyperbolicStructureClosed : H.hyperbolicStructure
  stableManifoldClosed : H.stableManifold
  unstableManifoldClosed : H.unstableManifold
  shadowingPropertyClosed : H.shadowingProperty

def HyperbolicInvariantSetsClosed {M : Type} [TopologicalSpace M] {f : M → M}
    (H : HyperbolicInvariantSetsPackage M f) : Prop :=
  H.invariantSet ∧ H.hyperbolicStructure ∧ H.stableManifold ∧ H.unstableManifold ∧ H.shadowingProperty

theorem hyperbolic_invariant_sets_closed_from_evidence
    {M : Type} [TopologicalSpace M] {f : M → M}
    (H : HyperbolicInvariantSetsPackage M f) (E : HyperbolicInvariantSetsEvidence H) :
    HyperbolicInvariantSetsClosed H := by
  exact And.intro E.invariantSetClosed
    (And.intro E.hyperbolicStructureClosed
      (And.intro E.stableManifoldClosed
        (And.intro E.unstableManifoldClosed E.shadowingPropertyClosed)))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse