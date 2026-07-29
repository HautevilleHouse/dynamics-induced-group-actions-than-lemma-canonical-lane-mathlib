import canonicalLaneMathlib.AdmissibleClass

/-!
# Group Action Dynamics Package
-/

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure GroupActionDynamicsPackage where
  group : Type u
  space : Type v
  action : group → space → space
  continuity : Prop
  topologicalEntropy : Prop
  mixingProperties : Prop

structure GroupActionDynamicsEvidence (P : GroupActionDynamicsPackage) where
  continuityClosed : P.continuity
  topologicalEntropyClosed : P.topologicalEntropy
  mixingPropertiesClosed : P.mixingProperties

def GroupActionDynamicsClosed (P : GroupActionDynamicsPackage) : Prop :=
  P.continuity ∧ P.topologicalEntropy ∧ P.mixingProperties

theorem group_action_dynamics_closed_from_evidence (P : GroupActionDynamicsPackage)
    (E : GroupActionDynamicsEvidence P) : GroupActionDynamicsClosed P := by
  exact And.intro E.continuityClosed
    (And.intro E.topologicalEntropyClosed E.mixingPropertiesClosed)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse
