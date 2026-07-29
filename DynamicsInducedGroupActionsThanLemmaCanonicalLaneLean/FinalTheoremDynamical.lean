import HautevilleHouse.DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.GateLemmasDynamical

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

def ConstrainedDynamicalClosure (A : AdmissibleClass') : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_endgame (A : AdmissibleClass') :
    ConstrainedDynamicalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse