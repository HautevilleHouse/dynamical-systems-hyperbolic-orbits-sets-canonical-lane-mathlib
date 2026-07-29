import DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

def bridgeClosed (M : Type u) [TopologicalSpace M] [MetricSpace M] (A : AdmissibleClass M) : Prop :=
  HyperbolicInvariantSetClosed M A.object

theorem bridge_from_admissible_class (M : Type u) [TopologicalSpace M] [MetricSpace M] (A : AdmissibleClass M) : bridgeClosed M A := by
  unfold bridgeClosed
  have h : HyperbolicInvariantSetClosed M A.object := by
    -- proof from the structure evidence would go here
    sorry
  exact h

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse