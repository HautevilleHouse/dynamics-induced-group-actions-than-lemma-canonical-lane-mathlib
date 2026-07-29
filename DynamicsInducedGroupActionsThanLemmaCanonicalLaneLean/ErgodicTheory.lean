import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure ErgodicTheoryPackage {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  (D : DynamicsInducedGroupActionPackage G X) where
  ergodicMeasures : Prop
  entropyTheory : Prop
  mixingProperties : Prop
  equidistribution : Prop

structure ErgodicTheoryEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (E : ErgodicTheoryPackage D) where
  ergodicMeasuresClosed : E.ergodicMeasures
  entropyTheoryClosed : E.entropyTheory
  mixingPropertiesClosed : E.mixingProperties
  equidistributionClosed : E.equidistribution

def ErgodicTheoryClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (E : ErgodicTheoryPackage D) : Prop :=
  E.ergodicMeasures ∧ E.entropyTheory ∧ E.mixingProperties ∧ E.equidistribution

theorem ergodic_theory_closed_from_evidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (E : ErgodicTheoryPackage D)
  (Ev : ErgodicTheoryEvidence E) : ErgodicTheoryClosed E :=
by
  exact And.intro Ev.ergodicMeasuresClosed (And.intro Ev.entropyTheoryClosed
    (And.intro Ev.mixingPropertiesClosed Ev.equidistributionClosed))

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse