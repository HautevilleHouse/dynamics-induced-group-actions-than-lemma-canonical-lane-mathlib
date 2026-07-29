import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure InvariantMeasurePackage {G : GroupActionFlowPackage} where
  measure : G.spaceType → Set (G.spaceType) → ℝ
  sigmaAdditive : Prop
  measureOfWholeSpace : Prop
  invariantUnderAction : ∀ (g : G.groupType) (s : Set G.spaceType), measure (G.action g '' s) = measure s
  inducedFlowInvariant : ∀ (t : ℝ) (s : Set G.spaceType), G.inducedFlow t '' s = s → measure s = 0 ∨ measure s = measure (Set.univ : Set G.spaceType)

structure InvariantMeasureEvidence {G : GroupActionFlowPackage} (M : InvariantMeasurePackage G) where
  sigmaAdditiveClosed : M.sigmaAdditive
  measureOfWholeSpaceClosed : M.measureOfWholeSpace
  invariantUnderActionClosed : M.invariantUnderAction
  inducedFlowInvariantClosed : M.inducedFlowInvariant

def InvariantMeasureClosed {G : GroupActionFlowPackage} (M : InvariantMeasurePackage G) : Prop :=
  M.sigmaAdditive ∧ M.measureOfWholeSpace ∧ M.invariantUnderAction ∧ M.inducedFlowInvariant

theorem invariant_measure_closed_from_evidence {G : GroupActionFlowPackage} (M : InvariantMeasurePackage G)
    (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M := by
  exact And.intro E.sigmaAdditiveClosed
    (And.intro E.measureOfWholeSpaceClosed
      (And.intro E.invariantUnderActionClosed E.inducedFlowInvariantClosed))

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse