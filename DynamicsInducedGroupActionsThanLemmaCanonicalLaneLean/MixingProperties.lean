import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure MixingPropertiesPackage {G : GroupActionFlowPackage} (M : InvariantMeasurePackage G) where
  weakMixing : Prop
  strongMixing : Prop
  mixingCoefficient : ℝ → ℝ
  decayRate : Prop
  weakMixingDefinition : ∀ (A B : Set G.spaceType), limit (M.measure (A ∩ (G.inducedFlow t '' B)) - M.measure A * M.measure B) (t → ∞) = 0
  strongMixingDefinition : ∀ (A B : Set G.spaceType), limit (M.measure ((G.inducedFlow t '' A) ∩ B) - M.measure A * M.measure B) (t → ∞) = 0

structure MixingPropertiesEvidence {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (MP : MixingPropertiesPackage G M) where
  weakMixingClosed : MP.weakMixing
  strongMixingClosed : MP.strongMixing
  decayRateClosed : MP.decayRate
  weakMixingDefinitionClosed : MP.weakMixingDefinition
  strongMixingDefinitionClosed : MP.strongMixingDefinition

def MixingPropertiesClosed {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (MP : MixingPropertiesPackage G M) : Prop :=
  MP.weakMixing ∧ MP.strongMixing ∧ MP.decayRate ∧ MP.weakMixingDefinition ∧ MP.strongMixingDefinition

theorem mixing_properties_closed_from_evidence {G : GroupActionFlowPackage} {M : InvariantMeasurePackage G} (MP : MixingPropertiesPackage G M) (E : MixingPropertiesEvidence MP) : MixingPropertiesClosed MP := by
  exact And.intro E.weakMixingClosed
    (And.intro E.strongMixingClosed
      (And.intro E.decayRateClosed
        (And.intro E.weakMixingDefinitionClosed E.strongMixingDefinitionClosed)))

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse