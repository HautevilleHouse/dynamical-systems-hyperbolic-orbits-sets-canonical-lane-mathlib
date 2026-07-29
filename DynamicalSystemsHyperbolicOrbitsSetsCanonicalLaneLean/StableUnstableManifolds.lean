import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure StableUnstableManifolds (M : Type) [TopologicalSpace M] [ChartedSpace (ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 3))) M] where
  x0 : M
  stableManifold : Set M
  unstableManifold : Set M
  stableImmersedSubmanifold : Prop
  unstableImmersedSubmanifold : Prop
  tangentAtX0Splits : Prop
  stableImmersedSubmanifoldWitness : stableImmersedSubmanifold
  unstableImmersedSubmanifoldWitness : unstableImmersedSubmanifold
  tangentAtX0SplitsWitness : tangentAtX0Splits

structure StableUnstableManifoldsEvidence (M : Type) [TopologicalSpace M] [ChartedSpace (ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 3))) M] (S : StableUnstableManifolds M) where
  stableImmersedSubmanifoldClosed : S.stableImmersedSubmanifold
  unstableImmersedSubmanifoldClosed : S.unstableImmersedSubmanifold
  tangentAtX0SplitsClosed : S.tangentAtX0Splits

def StableUnstableManifoldsClosed (M : Type) [TopologicalSpace M] [ChartedSpace (ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 3))) M] (S : StableUnstableManifolds M) : Prop :=
  S.stableImmersedSubmanifold ∧ S.unstableImmersedSubmanifold ∧ S.tangentAtX0Splits

theorem stable_unstable_manifolds_closed_from_evidence (M : Type) [TopologicalSpace M] [ChartedSpace (ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 3))) M] (S : StableUnstableManifolds M)
    (E : StableUnstableManifoldsEvidence M S) : StableUnstableManifoldsClosed M S := by
  exact And.intro E.stableImmersedSubmanifoldClosed (And.intro E.unstableImmersedSubmanifoldClosed E.tangentAtX0SplitsClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse