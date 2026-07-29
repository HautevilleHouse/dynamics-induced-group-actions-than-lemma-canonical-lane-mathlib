import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure GroupAction (G : Type u) (X : Type v) where
  act : G → X → X
  ident : ∀ x : X, act (1 : G) x = x
  comp : ∀ (g h : G) (x : X), act (g * h) x = act g (act h x)

structure DynamicsInducedGroupActionPackage (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] where
  action : GroupAction G X
  continuous : Continuous (Function.uncurry action.act)
  inducedDynamics : Type w -- e.g., flow or iteration
  invariantMeasures : Prop
  ergodicComponents : Prop
  mixingProperties : Prop

structure DynamicsInducedGroupActionEvidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (P : DynamicsInducedGroupActionPackage G X) where
  invariantMeasuresClosed : P.invariantMeasures
  ergodicComponentsClosed : P.ergodicComponents
  mixingPropertiesClosed : P.mixingProperties

def DynamicsInducedGroupActionClosed (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (P : DynamicsInducedGroupActionPackage G X) : Prop :=
  P.invariantMeasures ∧ P.ergodicComponents ∧ P.mixingProperties

theorem dynamics_induced_group_action_closed_from_evidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (P : DynamicsInducedGroupActionPackage G X) (E : DynamicsInducedGroupActionEvidence G X P) :
  DynamicsInducedGroupActionClosed G X P :=
by
  exact And.intro E.invariantMeasuresClosed (And.intro E.ergodicComponentsClosed E.mixingPropertiesClosed)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse