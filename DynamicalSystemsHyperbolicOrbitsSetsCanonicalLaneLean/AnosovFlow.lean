import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure AnosovFlow (M : Type) [TopologicalSpace M] [SmoothManifold M] where
  vectorField : (M → TangentSpace M)
  flow : ℝ → M → M
  invariantSplitting : ∀ x : M, TangentSpace x ≃ (EUs ⊕ ESu ⊕ ECu)
  hyperbolicDirection : Prop
  flowDirection : Prop
  integrability : Prop
  hyperbolicDirectionWitness : hyperbolicDirection
  flowDirectionWitness : flowDirection
  integrabilityWitness : integrability

structure AnosovFlowEvidence (M : Type) [TopologicalSpace M] [SmoothManifold M] (A : AnosovFlow M) where
  hyperbolicDirectionClosed : A.hyperbolicDirection
  flowDirectionClosed : A.flowDirection
  integrabilityClosed : A.integrability

def AnosovFlowClosed (M : Type) [TopologicalSpace M] [SmoothManifold M] (A : AnosovFlow M) : Prop :=
  A.hyperbolicDirection ∧ A.flowDirection ∧ A.integrability

theorem anosov_flow_closed_from_evidence (M : Type) [TopologicalSpace M] [SmoothManifold M] (A : AnosovFlow M)
    (E : AnosovFlowEvidence M A) : AnosovFlowClosed M A := by
  exact And.intro E.hyperbolicDirectionClosed (And.intro E.flowDirectionClosed E.integrabilityClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse