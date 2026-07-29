import canonicalLaneMathlib.AdmissibleClass
import DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.GroupActionDynamics

/-!
# Induced Representation Package
-/

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure InducedRepresentationPackage {G : GroupActionDynamicsPackage} where
  subgroup : Type w
  inclusion : subgroup → G.group
  inducedAction : subgroup → G.space → G.space
  inducedContinuity : Prop
  representationSpace : Type u
  representation : subgroup → representationSpace → representationSpace
  representationContinuity : Prop

structure InducedRepresentationEvidence {G : GroupActionDynamicsPackage}
    (R : InducedRepresentationPackage G) where
  inducedContinuityClosed : R.inducedContinuity
  representationContinuityClosed : R.representationContinuity

def InducedRepresentationClosed {G : GroupActionDynamicsPackage}
    (R : InducedRepresentationPackage G) : Prop :=
  R.inducedContinuity ∧ R.representationContinuity

theorem induced_representation_closed_from_evidence {G : GroupActionDynamicsPackage}
    (R : InducedRepresentationPackage G) (E : InducedRepresentationEvidence R) :
    InducedRepresentationClosed R := by
  exact And.intro E.inducedContinuityClosed E.representationContinuityClosed

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse
