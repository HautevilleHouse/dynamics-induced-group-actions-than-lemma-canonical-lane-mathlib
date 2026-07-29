import HautevilleHouse.DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.DynamicalSystemAdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure OrbitEquivalencePackage (D : DynamicalSystem) where
  invariantUnderAction : Prop
  orbitEquivalenceRelation : Prop
  equivalencePreservesDynamics : Prop
  orbitEquivalenceClosed : Prop

structure OrbitEquivalenceEvidence (D : DynamicalSystem) (O : OrbitEquivalencePackage D) where
  invariantUnderActionClosed : O.invariantUnderAction
  orbitEquivalenceRelationClosed : O.orbitEquivalenceRelation
  equivalencePreservesDynamicsClosed : O.equivalencePreservesDynamics
  orbitEquivalenceClosed : O.orbitEquivalenceClosed

def OrbitEquivalenceClosed (D : DynamicalSystem) (O : OrbitEquivalencePackage D) : Prop :=
  O.invariantUnderAction ∧ O.orbitEquivalenceRelation ∧ O.equivalencePreservesDynamics ∧ O.orbitEquivalenceClosed

theorem orbit_equivalence_closed_from_evidence (D : DynamicalSystem) (O : OrbitEquivalencePackage D)
    (E : OrbitEquivalenceEvidence D O) : OrbitEquivalenceClosed D O := by
  exact And.intro E.invariantUnderActionClosed
    (And.intro E.orbitEquivalenceRelationClosed
      (And.intro E.equivalencePreservesDynamicsClosed E.orbitEquivalenceClosed))

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse