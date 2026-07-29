import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.HyperbolicOrbitSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure SpectralDecompositionPackage (H : HyperbolicOrbitSet) where
  basicSetsDisjoint : Prop
  eachBasicSetTransitive : Prop
  omegaLimitSetDecomposed : Prop
  periodicPointsDense : Prop

structure SpectralDecompositionEvidence {H : HyperbolicOrbitSet} (S : SpectralDecompositionPackage H) where
  basicSetsDisjointClosed : S.basicSetsDisjoint
  eachBasicSetTransitiveClosed : S.eachBasicSetTransitive
  omegaLimitSetDecomposedClosed : S.omegaLimitSetDecomposed
  periodicPointsDenseClosed : S.periodicPointsDense

def SpectralDecompositionClosed {H : HyperbolicOrbitSet} (S : SpectralDecompositionPackage H) : Prop :=
  S.basicSetsDisjoint ∧ S.eachBasicSetTransitive ∧
  S.omegaLimitSetDecomposed ∧ S.periodicPointsDense

theorem spectral_decomposition_closed_from_evidence
    {H : HyperbolicOrbitSet} (S : SpectralDecompositionPackage H)
    (E : SpectralDecompositionEvidence S) : SpectralDecompositionClosed S := by
  exact And.intro E.basicSetsDisjointClosed
    (And.intro E.eachBasicSetTransitiveClosed
      (And.intro E.omegaLimitSetDecomposedClosed E.periodicPointsDenseClosed))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse