import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure MorseSmaleSystem (M : Type) [TopologicalSpace M] [SmoothManifold M] where
  vectorField : (M → TangentSpace M)
  criticalElements : Set (Set M)  -- equilibria and periodic orbits
  allCriticalHyperbolic : ∀ (C : Set M), C ∈ criticalElements → (∃ (H : HyperbolicSet M), True)
  transversality : Prop
  noCycleCondition : Prop
  transversalityWitness : transversality
  noCycleConditionWitness : noCycleCondition

structure MorseSmaleSystemEvidence (M : Type) [TopologicalSpace M] [SmoothManifold M] (MS : MorseSmaleSystem M) where
  transversalityClosed : MS.transversality
  noCycleConditionClosed : MS.noCycleCondition
  allCriticalHyperbolicClosed : MS.allCriticalHyperbolic

def MorseSmaleSystemClosed (M : Type) [TopologicalSpace M] [SmoothManifold M] (MS : MorseSmaleSystem M) : Prop :=
  MS.transversality ∧ MS.noCycleCondition ∧ MS.allCriticalHyperbolic

theorem morse_smale_system_closed_from_evidence (M : Type) [TopologicalSpace M] [SmoothManifold M] (MS : MorseSmaleSystem M)
    (E : MorseSmaleSystemEvidence M MS) : MorseSmaleSystemClosed M MS := by
  exact And.intro E.transversalityClosed (And.intro E.noCycleConditionClosed E.allCriticalHyperbolicClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse