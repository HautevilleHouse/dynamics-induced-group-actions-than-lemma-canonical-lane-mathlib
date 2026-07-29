import canonicalLaneMathlib.AdmissibleClass
import DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.InducedRepresentation

/-!
# Than Lemma Core Package
-/

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure ThanLemmaCorePackage {G : GroupActionDynamicsPackage}
    {R : InducedRepresentationPackage G} where
  thanLemmaStatement : Prop
  lemmaProof : Prop
  corollaryEquivariance : Prop

structure ThanLemmaCoreEvidence {G : GroupActionDynamicsPackage}
    {R : InducedRepresentationPackage G} (T : ThanLemmaCorePackage G R) where
  thanLemmaStatementClosed : T.thanLemmaStatement
  lemmaProofClosed : T.lemmaProof
  corollaryEquivarianceClosed : T.corollaryEquivariance

def ThanLemmaCoreClosed {G : GroupActionDynamicsPackage}
    {R : InducedRepresentationPackage G} (T : ThanLemmaCorePackage G R) : Prop :=
  T.thanLemmaStatement ∧ T.lemmaProof ∧ T.corollaryEquivariance

theorem than_lemma_core_closed_from_evidence {G : GroupActionDynamicsPackage}
    {R : InducedRepresentationPackage G} (T : ThanLemmaCorePackage G R)
    (E : ThanLemmaCoreEvidence T) : ThanLemmaCoreClosed T := by
  exact And.intro E.thanLemmaStatementClosed
    (And.intro E.lemmaProofClosed E.corollaryEquivarianceClosed)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse
