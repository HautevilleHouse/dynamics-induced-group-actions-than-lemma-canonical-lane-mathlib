import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure RecurrencePackage {G : GroupActionFlowPackage} (M : InvariantMeasurePackage G) where
  poincareRecurrence : ∀ (s : Set G.spaceType), M.measure s > 0 → ∃ (x ∈ s) (t > 0), G.inducedFlow t x ∈ s
  infiniteReturn : ∀ (s : Set G.spaceType), M.measure s > 0 → ∀ (N : ℕ), ∃ (x ∈ s) (t > N), G.inducedFlow t x ∈ s
  conservativeProperty : ∀ (s : Set G.spaceType), M.measure s > 0 → ∃ (g : G.groupType), G.action g '' s ∩ s ≠ ∅

structure RecurrenceEvidence {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (R : RecurrencePackage G M) where
  poincareRecurrenceClosed : R.poincareRecurrence
  infiniteReturnClosed : R.infiniteReturn
  conservativePropertyClosed : R.conservativeProperty

def RecurrenceClosed {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (R : RecurrencePackage G M) : Prop :=
  R.poincareRecurrence ∧ R.infiniteReturn ∧ R.conservativeProperty

theorem recurrence_closed_from_evidence {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (R : RecurrencePackage G M) (E : RecurrenceEvidence R) : RecurrenceClosed R := by
  exact And.intro E.poincareRecurrenceClosed
    (And.intro E.infiniteReturnClosed E.conservativePropertyClosed)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse