import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure EquilibriumStatePackage where
  potentialFunction : Type u
  invariantMeasure : Type u
  pressure : ℝ
  variationalPrinciple : Prop
  gibbsProperty : Prop

structure EquilibriumStateEvidence (E : EquilibriumStatePackage) where
  variationalPrincipleClosed : E.variationalPrinciple
  gibbsPropertyClosed : E.gibbsProperty

def EquilibriumStateClosed (E : EquilibriumStatePackage) : Prop :=
  E.variationalPrinciple ∧ E.gibbsProperty

theorem equilibrium_state_closed_from_evidence (E : EquilibriumStatePackage) (Ev : EquilibriumStateEvidence E) : EquilibriumStateClosed E := by
  exact And.intro Ev.variationalPrincipleClosed Ev.gibbsPropertyClosed

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse