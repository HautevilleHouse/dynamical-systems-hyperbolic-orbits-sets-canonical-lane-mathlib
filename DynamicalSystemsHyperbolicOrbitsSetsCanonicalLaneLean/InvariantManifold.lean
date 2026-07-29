import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.HyperbolicOrbit

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure StableManifold (M : Type) [TopologicalSpace M] [MetricSpace M] (O : HyperbolicOrbit M) where
  stableSet : Set M
  tangentSpace : Type
  contractionEstimate : Prop
  localCharacterization : Prop

def StableManifoldClosed (S : StableManifold M O) : Prop :=
  S.contractionEstimate ∧ S.localCharacterization

structure UnstableManifold (M : Type) [TopologicalSpace M] [MetricSpace M] (O : HyperbolicOrbit M) where
  unstableSet : Set M
  tangentSpace : Type
  expansionEstimate : Prop
  localCharacterization : Prop

def UnstableManifoldClosed (U : UnstableManifold M O) : Prop :=
  U.expansionEstimate ∧ U.localCharacterization

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse
