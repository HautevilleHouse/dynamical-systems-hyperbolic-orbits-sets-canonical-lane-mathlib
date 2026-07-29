import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure MarkovPartitionPackage where
  partitionSet : Type u
  shiftMap : Type u
  symbolicDynamics : Prop
  finiteTypeProperty : Prop
  mixingCondition : Prop

structure MarkovPartitionEvidence (M : MarkovPartitionPackage) where
  symbolicDynamicsClosed : M.symbolicDynamics
  finiteTypePropertyClosed : M.finiteTypeProperty
  mixingConditionClosed : M.mixingCondition

def MarkovPartitionClosed (M : MarkovPartitionPackage) : Prop :=
  M.symbolicDynamics ∧ M.finiteTypeProperty ∧ M.mixingCondition

theorem markov_partition_closed_from_evidence (M : MarkovPartitionPackage) (E : MarkovPartitionEvidence M) : MarkovPartitionClosed M := by
  exact And.intro E.symbolicDynamicsClosed (And.intro E.finiteTypePropertyClosed E.mixingConditionClosed)

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse