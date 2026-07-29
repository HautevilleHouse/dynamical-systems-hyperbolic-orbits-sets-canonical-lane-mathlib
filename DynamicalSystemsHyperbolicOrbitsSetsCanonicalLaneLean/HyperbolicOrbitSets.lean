import DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicOrbitSet (M : Type u) [TopologicalSpace M] where
  point : M
  tangentSpace : Type v
  norm : tangentSpace → ℝ
  hyperbolicSplitting : Prop
  stableBundle : tangentSpace → Submodule ℝ tangentSpace
  unstableBundle : tangentSpace → Submodule ℝ tangentSpace
  contractionRate : ℝ
  expansionRate : ℝ
  invariantUnderDynamics : Prop

structure HyperbolicOrbitSetEvidence (M : Type u) [TopologicalSpace M] (H : HyperbolicOrbitSet M) where
  hyperbolicSplittingClosed : H.hyperbolicSplitting
  invariantUnderDynamicsClosed : H.invariantUnderDynamics
  contractionRatePositive : H.contractionRate > 0
  expansionRatePositive : H.expansionRate > 0

def HyperbolicOrbitSetClosed (M : Type u) [TopologicalSpace M] (H : HyperbolicOrbitSet M) : Prop :=
  H.hyperbolicSplitting ∧ H.invariantUnderDynamics ∧ H.contractionRate > 0 ∧ H.expansionRate > 0

theorem hyperbolic_orbit_set_closed_from_evidence (M : Type u) [TopologicalSpace M] (H : HyperbolicOrbitSet M) (E : HyperbolicOrbitSetEvidence M H) : HyperbolicOrbitSetClosed M H := by
  exact And.intro E.hyperbolicSplittingClosed
    (And.intro E.invariantUnderDynamicsClosed
      (And.intro E.contractionRatePositive E.expansionRatePositive))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse