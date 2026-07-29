import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicOrbit (M : Type) [TopologicalSpace M] where
  periodicPoint : M
  period : ℝ
  orbitSet : Set M
  hyperbolicStructure : HyperbolicSet M
  linearizationInvertible : Prop
  periodicCondition : Prop
  linearizationInvertibleWitness : linearizationInvertible
  periodicConditionWitness : periodicCondition

structure HyperbolicOrbitEvidence (M : Type) [TopologicalSpace M] (O : HyperbolicOrbit M) where
  linearizationInvertibleClosed : O.linearizationInvertible
  periodicConditionClosed : O.periodicCondition
  hyperbolicStructureClosed : HyperbolicSetClosed M O.hyperbolicStructure

def HyperbolicOrbitClosed (M : Type) [TopologicalSpace M] (O : HyperbolicOrbit M) : Prop :=
  O.linearizationInvertible ∧ O.periodicCondition ∧ HyperbolicSetClosed M O.hyperbolicStructure

theorem hyperbolic_orbit_closed_from_evidence (M : Type) [TopologicalSpace M] (O : HyperbolicOrbit M)
    (E : HyperbolicOrbitEvidence M O) : HyperbolicOrbitClosed M O := by
  exact And.intro E.linearizationInvertibleClosed
    (And.intro E.periodicConditionClosed E.hyperbolicStructureClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse