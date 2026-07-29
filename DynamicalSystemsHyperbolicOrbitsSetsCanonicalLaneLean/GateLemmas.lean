import DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

def gateClosed (M : Type u) [TopologicalSpace M] [MetricSpace M] (A : AdmissibleClass M) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (M : Type u) [TopologicalSpace M] [MetricSpace M] (A : AdmissibleClass M) : gateClosed M A := by
  exact A.gateWitness

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse