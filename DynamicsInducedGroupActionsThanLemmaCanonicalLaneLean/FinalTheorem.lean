import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.GroupActionOrbitSpace
import HautevilleHouse.DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.DynamicsInducedThanLemma

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

def ConstrainedDynamicsInducedThanLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamics_induced_than_lemma_endgame (A : AdmissibleClass) :
    ConstrainedDynamicsInducedThanLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse
