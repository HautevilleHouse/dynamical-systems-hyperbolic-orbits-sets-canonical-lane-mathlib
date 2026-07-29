import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.HyperbolicInvariantSets

/-!
# Orbit Structure Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure OrbitStructurePackage {M : Type} [TopologicalSpace M] {f : M → M}
    (H : HyperbolicInvariantSetsPackage M f) where
  periodicOrbits : Set (ℕ × M)
  denseOrbits : Set M
  shadowingOrbits : Prop
  specificationProperty : Prop

structure OrbitStructureEvidence {M : Type} [TopologicalSpace M] {f : M → M}
    {H : HyperbolicInvariantSetsPackage M f} (O : OrbitStructurePackage H) where
  periodicOrbitsClosed : O.periodicOrbits
  denseOrbitsClosed : O.denseOrbits
  shadowingOrbitsClosed : O.shadowingOrbits
  specificationPropertyClosed : O.specificationProperty

def OrbitStructureClosed {M : Type} [TopologicalSpace M] {f : M → M}
    {H : HyperbolicInvariantSetsPackage M f} (O : OrbitStructurePackage H) : Prop :=
  O.periodicOrbits ∧ O.denseOrbits ∧ O.shadowingOrbits ∧ O.specificationProperty

theorem orbit_structure_closed_from_evidence
    {M : Type} [TopologicalSpace M] {f : M → M}
    {H : HyperbolicInvariantSetsPackage M f} (O : OrbitStructurePackage H)
    (E : OrbitStructureEvidence O) : OrbitStructureClosed O := by
  exact And.intro E.periodicOrbitsClosed
    (And.intro E.denseOrbitsClosed
      (And.intro E.shadowingOrbitsClosed E.specificationPropertyClosed))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse