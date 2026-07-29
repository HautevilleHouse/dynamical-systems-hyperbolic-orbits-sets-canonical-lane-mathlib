import HautevilleHouse.DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def hyperbolicProjection : Projection HyperbolicEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem hyperbolic_projection_idempotent (x : HyperbolicEndgameState) :
    hyperbolicProjection.toFun (hyperbolicProjection.toFun x) = hyperbolicProjection.toFun x := by
  exact hyperbolicProjection.idempotent x

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse