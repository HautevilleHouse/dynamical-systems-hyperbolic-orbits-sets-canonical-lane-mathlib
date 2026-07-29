import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure ClosingLemma (M : Type) [TopologicalSpace M] [MetricSpace M] where
  f : M → M
  fContinuous : Continuous f
  nonwanderingPoint : M
  epsilon : ℝ
  epsilonPos : epsilon > 0
  periodicPoint : M
  periodicOrbit : ℕ → M
  closeOrbit : ∀ n : ℕ, dist (periodicOrbit n) (nonwanderingPoint) < epsilon
  periodicCondition : periodicOrbit 0 = periodicPoint ∧ periodicOrbit (period + 1) = periodicPoint

structure ClosingLemmaEvidence (M : Type) [TopologicalSpace M] [MetricSpace M] (C : ClosingLemma M) where
  closeOrbitClosed : C.closeOrbit
  periodicConditionClosed : C.periodicCondition
  epsilonPosClosed : C.epsilonPos

def ClosingLemmaClosed (M : Type) [TopologicalSpace M] [MetricSpace M] (C : ClosingLemma M) : Prop :=
  C.closeOrbit ∧ C.periodicCondition ∧ C.epsilonPos

theorem closing_lemma_closed_from_evidence (M : Type) [TopologicalSpace M] [MetricSpace M] (C : ClosingLemma M)
    (E : ClosingLemmaEvidence M C) : ClosingLemmaClosed M C := by
  exact And.intro E.closeOrbitClosed (And.intro E.periodicConditionClosed E.epsilonPosClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse