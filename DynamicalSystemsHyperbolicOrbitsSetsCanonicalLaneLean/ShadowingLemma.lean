import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure ShadowingLemma (M : Type) [TopologicalSpace M] [MetricSpace M] where
  epsilon : ℝ
  delta : ℝ
  epsilonPos : epsilon > 0
  deltaPos : delta > 0
  pseudoOrbit : ℕ → M
  shadowingOrbit : ℕ → M
  pseudoOrbitProperty : ∀ n : ℕ, dist (pseudoOrbit (n+1)) (f (pseudoOrbit n)) < delta
  shadowingCondition : ∀ n : ℕ, dist (shadowingOrbit n) (pseudoOrbit n) < epsilon
  epsilonDeltaRelation : epsilon < delta

structure ShadowingLemmaEvidence (M : Type) [TopologicalSpace M] [MetricSpace M] (S : ShadowingLemma M) where
  pseudoOrbitPropertyClosed : S.pseudoOrbitProperty
  shadowingConditionClosed : S.shadowingCondition
  epsilonDeltaRelationClosed : S.epsilonDeltaRelation

def ShadowingLemmaClosed (M : Type) [TopologicalSpace M] [MetricSpace M] (S : ShadowingLemma M) : Prop :=
  S.pseudoOrbitProperty ∧ S.shadowingCondition ∧ S.epsilonDeltaRelation

theorem shadowing_lemma_closed_from_evidence (M : Type) [TopologicalSpace M] [MetricSpace M] (S : ShadowingLemma M)
    (E : ShadowingLemmaEvidence M S) : ShadowingLemmaClosed M S := by
  exact And.intro E.pseudoOrbitPropertyClosed (And.intro E.shadowingConditionClosed E.epsilonDeltaRelationClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse