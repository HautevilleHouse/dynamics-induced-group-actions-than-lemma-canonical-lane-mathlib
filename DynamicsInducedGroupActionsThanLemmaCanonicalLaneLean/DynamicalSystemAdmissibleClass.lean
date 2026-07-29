import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure DynamicalSystem where
  carrier : Type u
  topology : TopologicalSpace carrier
  group : Type v
  groupTopology : TopologicalSpace group
  groupOperation : group → group → group
  action : group → carrier → carrier
  continuity : Prop

structure AdmittedDynamicalObject where
  system : DynamicalSystem
  orbitClassification : Prop
  invariantMeasureExists : Prop
  ergodicDecomposition : Prop
  conclusion : orbitClassification

structure AdmissibleClass' where
  object : AdmittedDynamicalObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedDynamicalClosure (A : AdmissibleClass') : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse