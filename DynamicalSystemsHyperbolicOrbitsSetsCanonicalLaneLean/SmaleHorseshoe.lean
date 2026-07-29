import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure SmaleHorseshoe (M : Type) [TopologicalSpace M] where
  square : Set M
  f : M → M
  image : Set M
  horseshoeMapContinuous : Continuous f
  imageContained : image ⊆ square
  stretchingInOneDirection : Prop
  contractingInOtherDirection : Prop
  topologicalTransitivity : Prop
  hyperbolicInvariantSet : HyperbolicSet M
  stretchingInOneDirectionWitness : stretchingInOneDirection
  contractingInOtherDirectionWitness : contractingInOtherDirection
  topologicalTransitivityWitness : topologicalTransitivity
  hyperbolicInvariantSetClosed : HyperbolicSetClosed M hyperbolicInvariantSet

structure SmaleHorseshoeEvidence (M : Type) [TopologicalSpace M] (H : SmaleHorseshoe M) where
  stretchingInOneDirectionClosed : H.stretchingInOneDirection
  contractingInOtherDirectionClosed : H.contractingInOtherDirection
  topologicalTransitivityClosed : H.topologicalTransitivity
  hyperbolicInvariantSetClosed : HyperbolicSetClosed M H.hyperbolicInvariantSet

def SmaleHorseshoeClosed (M : Type) [TopologicalSpace M] (H : SmaleHorseshoe M) : Prop :=
  H.stretchingInOneDirection ∧ H.contractingInOtherDirection ∧ H.topologicalTransitivity ∧
  HyperbolicSetClosed M H.hyperbolicInvariantSet

theorem smale_horseshoe_closed_from_evidence (M : Type) [TopologicalSpace M] (H : SmaleHorseshoe M)
    (E : SmaleHorseshoeEvidence M H) : SmaleHorseshoeClosed M H := by
  exact And.intro E.stretchingInOneDirectionClosed
    (And.intro E.contractingInOtherDirectionClosed
      (And.intro E.topologicalTransitivityClosed E.hyperbolicInvariantSetClosed))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse