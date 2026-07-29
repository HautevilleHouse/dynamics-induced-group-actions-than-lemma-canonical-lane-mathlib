import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure ErgodicDecompositionPackage {G : GroupActionFlowPackage} (M : InvariantMeasurePackage G) where
  ergodicComponents : Set (InvariantMeasurePackage G)
  decompositionProperty : ∀ (s : Set G.spaceType), M.measure s = ∑ μ in ergodicComponents, μ.measure s
  ergodicMeasures : ∀ μ ∈ ergodicComponents, ErgodicMeasure μ

structure ErgodicMeasure (M : InvariantMeasurePackage G) where
  ergodicProperty : ∀ (s : Set G.spaceType), (∀ (g : G.groupType), M.measure (s ∆ (G.action g '' s)) = 0) → M.measure s = 0 ∨ M.measure s = M.measure Set.univ

structure ErgodicDecompositionEvidence {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (E : ErgodicDecompositionPackage G M) where
  decompositionPropertyClosed : E.decompositionProperty
  ergodicMeasuresClosed : E.ergodicMeasures

def ErgodicDecompositionClosed {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (E : ErgodicDecompositionPackage G M) : Prop :=
  E.decompositionProperty ∧ E.ergodicMeasures

theorem ergodic_decomposition_closed_from_evidence {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (E : ErgodicDecompositionPackage G M) (Ev : ErgodicDecompositionEvidence E) : ErgodicDecompositionClosed E := by
  exact And.intro Ev.decompositionPropertyClosed Ev.ergodicMeasuresClosed

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse