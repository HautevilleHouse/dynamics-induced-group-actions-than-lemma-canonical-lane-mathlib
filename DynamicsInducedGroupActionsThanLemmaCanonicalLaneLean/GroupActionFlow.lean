import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure GroupActionFlowPackage where
  groupType : Type u
  spaceType : Type v
  topology : TopologicalSpace spaceType
  action : groupType → spaceType → spaceType
  continuity : Prop
  groupTopology : TopologicalSpace groupType
  continuousGroupAction : Prop
  inducedFlow : ℝ → spaceType → spaceType
  flowContinuous : Prop
  flowGroupCompatibility : Prop

structure GroupActionFlowEvidence (G : GroupActionFlowPackage) where
  continuityClosed : G.continuity
  continuousGroupActionClosed : G.continuousGroupAction
  flowContinuousClosed : G.flowContinuous
  flowGroupCompatibilityClosed : G.flowGroupCompatibility

def GroupActionFlowClosed (G : GroupActionFlowPackage) : Prop :=
  G.continuity ∧ G.continuousGroupAction ∧ G.flowContinuous ∧ G.flowGroupCompatibility

theorem group_action_flow_closed_from_evidence (G : GroupActionFlowPackage)
    (E : GroupActionFlowEvidence G) : GroupActionFlowClosed G := by
  exact And.intro E.continuityClosed
    (And.intro E.continuousGroupActionClosed
      (And.intro E.flowContinuousClosed E.flowGroupCompatibilityClosed))

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse