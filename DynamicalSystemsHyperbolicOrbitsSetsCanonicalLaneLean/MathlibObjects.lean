import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.TheoremStatement
import HautevilleHouse.CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure HyperbolicSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  metric : carrier → carrier → ℝ

structure HyperbolicAdmittedObject where
  space : HyperbolicSpace
  hyperbolicSubset : Prop
  invariantSet : Prop
  orbitStructure : Type
  orbitTopology : TopologicalSpace orbitStructure
  hyperbolicOrbit : Prop
  conclusion : hyperbolicOrbit

structure HyperbolicEndgameState where
  object : HyperbolicAdmittedObject

def HyperbolicWitnessClosed (O : HyperbolicAdmittedObject) : Prop :=
  O.hyperbolicOrbit

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse