import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure UniformHyperbolicityPackage where
  baseMap : Type u → Type u
  invariantSet : Type u
  expansionRate : ℝ
  contractionRate : ℝ
  uniformBounds : Prop
  splittingContinuous : Prop

structure UniformHyperbolicityEvidence (U : UniformHyperbolicityPackage) where
  uniformBoundsClosed : U.uniformBounds
  splittingContinuousClosed : U.splittingContinuous

def UniformHyperbolicityClosed (U : UniformHyperbolicityPackage) : Prop :=
  U.uniformBounds ∧ U.splittingContinuous

theorem uniform_hyperbolicity_closed_from_evidence (U : UniformHyperbolicityPackage) (E : UniformHyperbolicityEvidence U) : UniformHyperbolicityClosed U := by
  exact And.intro E.uniformBoundsClosed E.splittingContinuousClosed

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse