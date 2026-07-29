import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure DynamicsInducedThanLemmaPackage (G : GroupActionOrbitSpacePackage) where
  dynamicsMorphism : Type v → Type v
  dynamicsMorphismContinuous : Prop
  dynamicsMorphismEquivariant : ∀ (g : G.group) (x : Type v), dynamicsMorphism (G.actionOnSpace g x) = G.actionOnSpace g (dynamicsMorphism x)
  thanLemmaStatement : Prop
  thanLemmaProof : thanLemmaStatement

structure DynamicsInducedThanLemmaEvidence {G : GroupActionOrbitSpacePackage} (P : DynamicsInducedThanLemmaPackage G) where
  thanLemmaStatementClosed : P.thanLemmaStatement
  thanLemmaProofClosed : P.thanLemmaProof

def DynamicsInducedThanLemmaClosed {G : GroupActionOrbitSpacePackage} (P : DynamicsInducedThanLemmaPackage G) : Prop :=
  P.thanLemmaStatement ∧ P.thanLemmaProof

theorem dynamics_induced_than_lemma_closed_from_evidence
    {G : GroupActionOrbitSpacePackage} (P : DynamicsInducedThanLemmaPackage G)
    (E : DynamicsInducedThanLemmaEvidence P) : DynamicsInducedThanLemmaClosed P := by
  exact And.intro E.thanLemmaStatementClosed E.thanLemmaProofClosed

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse
