import DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean.SmaleHorseshoe

namespace HautevilleHouse
namespace DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean

structure HyperbolicInvariantSet (M : Type u) [TopologicalSpace M] [MetricSpace M] where
  invariantSet : Set M
  hyperbolicStructure : Prop
  stableUnstableDecomposition : Prop
  bottleneckProperty : Prop
  markovPartition : Prop

structure HyperbolicInvariantSetEvidence (M : Type u) [TopologicalSpace M] [MetricSpace M] (I : HyperbolicInvariantSet M) where
  hyperbolicStructureClosed : I.hyperbolicStructure
  stableUnstableDecompositionClosed : I.stableUnstableDecomposition
  bottleneckPropertyClosed : I.bottleneckProperty
  markovPartitionClosed : I.markovPartition

def HyperbolicInvariantSetClosed (M : Type u) [TopologicalSpace M] [MetricSpace M] (I : HyperbolicInvariantSet M) : Prop :=
  I.hyperbolicStructure ∧ I.stableUnstableDecomposition ∧ I.bottleneckProperty ∧ I.markovPartition

theorem hyperbolic_invariant_set_closed_from_evidence (M : Type u) [TopologicalSpace M] [MetricSpace M] (I : HyperbolicInvariantSet M) (E : HyperbolicInvariantSetEvidence M I) : HyperbolicInvariantSetClosed M I := by
  exact And.intro E.hyperbolicStructureClosed
    (And.intro E.stableUnstableDecompositionClosed
      (And.intro E.bottleneckPropertyClosed E.markovPartitionClosed))

end DynamicalSystemsHyperbolicOrbitsSetsCanonicalLaneLean
end HautevilleHouse