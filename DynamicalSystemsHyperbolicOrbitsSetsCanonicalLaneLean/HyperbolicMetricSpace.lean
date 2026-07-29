import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicMetricSpace where
  carrier : Type u
  dist : carrier → carrier → ℝ
  negativeCurvatureBound : Prop
  metricTreeLike : Prop
  GromovProductPositive : Prop
  geodesicSpace : Prop

structure HyperbolicMetricEvidence (M : HyperbolicMetricSpace) where
  negativeCurvatureBoundClosed : M.negativeCurvatureBound
  metricTreeLikeClosed : M.metricTreeLike
  GromovProductPositiveClosed : M.GromovProductPositive
  geodesicSpaceClosed : M.geodesicSpace

def HyperbolicMetricClosed (M : HyperbolicMetricSpace) : Prop :=
  M.negativeCurvatureBound ∧ M.metricTreeLike ∧ M.GromovProductPositive ∧ M.geodesicSpace

theorem hyperbolic_metric_closed_from_evidence (M : HyperbolicMetricSpace) (E : HyperbolicMetricEvidence M) : HyperbolicMetricClosed M := by
  exact And.intro E.negativeCurvatureBoundClosed (And.intro E.metricTreeLikeClosed (And.intro E.GromovProductPositiveClosed E.geodesicSpaceClosed))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse