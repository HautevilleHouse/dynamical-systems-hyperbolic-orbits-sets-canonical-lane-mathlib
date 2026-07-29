import DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  hyperbolicInvariantSet : Prop
  shadowingProperty : Prop
  conclusion : hyperbolicInvariantSet

def HyperbolicWitnessClosed (O : HyperbolicAdmittedObject) : Prop :=
  O.hyperbolicInvariantSet

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse