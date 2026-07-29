import HautevilleHouse.DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.OrbitEquivalenceInvariant

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure ErgodicDecompositionPackage (D : DynamicalSystem) where
  invariantMeasureFamily : Type u
  ergodicComponentIdentification : Prop
  decompositionMeasurePreserving : Prop
  ergodicComponentsCoverSystem : Prop

structure ErgodicDecompositionEvidence (D : DynamicalSystem) (E : ErgodicDecompositionPackage D) where
  invariantMeasureFamilyClosed : E.invariantMeasureFamily
  ergodicComponentIdentificationClosed : E.ergodicComponentIdentification
  decompositionMeasurePreservingClosed : E.decompositionMeasurePreserving
  ergodicComponentsCoverSystemClosed : E.ergodicComponentsCoverSystem

def ErgodicDecompositionClosed (D : DynamicalSystem) (E : ErgodicDecompositionPackage D) : Prop :=
  E.invariantMeasureFamily ∧ E.ergodicComponentIdentification ∧
  E.decompositionMeasurePreserving ∧ E.ergodicComponentsCoverSystem

theorem ergodic_decomposition_closed_from_evidence (D : DynamicalSystem) (P : ErgodicDecompositionPackage D)
    (Ev : ErgodicDecompositionEvidence D P) : ErgodicDecompositionClosed D P := by
  exact And.intro Ev.invariantMeasureFamilyClosed
    (And.intro Ev.ergodicComponentIdentificationClosed
      (And.intro Ev.decompositionMeasurePreservingClosed Ev.ergodicComponentsCoverSystemClosed))

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse