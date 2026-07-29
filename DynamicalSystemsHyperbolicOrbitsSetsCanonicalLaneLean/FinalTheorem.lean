import DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

def ConstrainedHyperbolicClosure (M : Type u) [TopologicalSpace M] [MetricSpace M] (A : AdmissibleClass M) : Prop :=
  bridgeClosed M A ∧ gateClosed M A

theorem constrained_hyperbolic_endgame (M : Type u) [TopologicalSpace M] [MetricSpace M] (A : AdmissibleClass M) : ConstrainedHyperbolicClosure M A := by
  exact And.intro (bridge_from_admissible_class M A) (gate_from_admissible_class M A)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse