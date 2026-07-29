import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicSet (M : Type) [TopologicalSpace M] where
  underlyingSet : Set M
  tangentBundle : Type
  invariantSplitting : Type
  uniformExpansion : Prop
  uniformContraction : Prop
  splittingContinuous : Prop
  uniformExpansionWitness : uniformExpansion
  uniformContractionWitness : uniformContraction
  splittingContinuousWitness : splittingContinuous

structure HyperbolicSetEvidence (M : Type) [TopologicalSpace M] (H : HyperbolicSet M) where
  uniformExpansionClosed : H.uniformExpansion
  uniformContractionClosed : H.uniformContraction
  splittingContinuousClosed : H.splittingContinuous

def HyperbolicSetClosed (M : Type) [TopologicalSpace M] (H : HyperbolicSet M) : Prop :=
  H.uniformExpansion ∧ H.uniformContraction ∧ H.splittingContinuous

theorem hyperbolic_set_closed_from_evidence (M : Type) [TopologicalSpace M] (H : HyperbolicSet M)
    (E : HyperbolicSetEvidence M H) : HyperbolicSetClosed M H := by
  exact And.intro E.uniformExpansionClosed (And.intro E.uniformContractionClosed E.splittingContinuousClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse