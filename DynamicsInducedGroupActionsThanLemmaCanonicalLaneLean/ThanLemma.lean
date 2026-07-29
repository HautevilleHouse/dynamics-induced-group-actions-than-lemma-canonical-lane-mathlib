import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure ThanLemmaPackage {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  (D : DynamicsInducedGroupActionPackage G X) where
  thanStatement : Prop
  spectralDecomposition : Prop
  rigidityProperty : Prop
  orbitClassification : Prop

structure ThanLemmaEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (T : ThanLemmaPackage D) where
  thanStatementClosed : T.thanStatement
  spectralDecompositionClosed : T.spectralDecomposition
  rigidityPropertyClosed : T.rigidityProperty
  orbitClassificationClosed : T.orbitClassification

def ThanLemmaClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (T : ThanLemmaPackage D) : Prop :=
  T.thanStatement ∧ T.spectralDecomposition ∧ T.rigidityProperty ∧ T.orbitClassification

theorem than_lemma_closed_from_evidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (T : ThanLemmaPackage D) (E : ThanLemmaEvidence T) :
  ThanLemmaClosed T :=
by
  exact And.intro E.thanStatementClosed
    (And.intro E.spectralDecompositionClosed
      (And.intro E.rigidityPropertyClosed E.orbitClassificationClosed))

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse