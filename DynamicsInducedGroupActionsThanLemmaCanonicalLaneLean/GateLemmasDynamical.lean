import HautevilleHouse.DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.BridgeLemmasDynamical

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass') : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass') :
    gateClosed A := by
  exact A.gateWitness

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse