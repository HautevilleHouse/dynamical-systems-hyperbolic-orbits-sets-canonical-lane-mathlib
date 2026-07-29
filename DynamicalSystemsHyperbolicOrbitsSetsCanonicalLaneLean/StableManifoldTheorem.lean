import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.HyperbolicOrbitSet

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure StableManifoldTheoremPackage (H : HyperbolicOrbitSet) where
  stableManifoldExists : Prop
  unstableManifoldExists : Prop
  tangentBundleSplitting : Prop
  foliationStructure : Prop

structure StableManifoldTheoremEvidence {H : HyperbolicOrbitSet} (S : StableManifoldTheoremPackage H) where
  stableManifoldExistsClosed : S.stableManifoldExists
  unstableManifoldExistsClosed : S.unstableManifoldExists
  tangentBundleSplittingClosed : S.tangentBundleSplitting
  foliationStructureClosed : S.foliationStructure

def StableManifoldTheoremClosed {H : HyperbolicOrbitSet} (S : StableManifoldTheoremPackage H) : Prop :=
  S.stableManifoldExists ∧ S.unstableManifoldExists ∧
  S.tangentBundleSplitting ∧ S.foliationStructure

theorem stable_manifold_theorem_closed_from_evidence
    {H : HyperbolicOrbitSet} (S : StableManifoldTheoremPackage H)
    (E : StableManifoldTheoremEvidence S) : StableManifoldTheoremClosed S := by
  exact And.intro E.stableManifoldExistsClosed
    (And.intro E.unstableManifoldExistsClosed
      (And.intro E.tangentBundleSplittingClosed E.foliationStructureClosed))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse