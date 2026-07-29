import DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.HyperbolicInvariantSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure AdmissibleClass (M : Type u) [TopologicalSpace M] [MetricSpace M] where
  object : HyperbolicInvariantSet M
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (M : Type u) [TopologicalSpace M] [MetricSpace M] (A : AdmissibleClass M) : Prop :=
  HyperbolicInvariantSetClosed M A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse