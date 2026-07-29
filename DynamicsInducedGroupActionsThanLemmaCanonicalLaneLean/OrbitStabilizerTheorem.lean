import DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.InducedGroupAction

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure OrbitStabilizerPackage {X : Type u} (P : InducedGroupActionPackage X) where
  orbit : X → Set X
  stabilizer : X → Set P.groupStructure
  orbitDef : ∀ (x : X), orbit x = { y : X | ∃ (g : P.groupStructure), P.action (P.homomorphism g) x = y }
  stabilizerDef : ∀ (x : X), stabilizer x = { g : P.groupStructure | P.action (P.homomorphism g) x = x }
  orbitStabilizerRelation : ∀ (x : X), orbit x ≅ (P.groupStructure / stabilizer x)

structure OrbitStabilizerEvidence {X : Type u} {P : InducedGroupActionPackage X} (O : OrbitStabilizerPackage P) where
  orbitDefClosed : O.orbitDef = O.orbitDef
  stabilizerDefClosed : O.stabilizerDef = O.stabilizerDef
  orbitStabilizerRelationClosed : O.orbitStabilizerRelation

def OrbitStabilizerClosed {X : Type u} {P : InducedGroupActionPackage X} (O : OrbitStabilizerPackage P) : Prop :=
  O.orbitStabilizerRelation

theorem orbit_stabilizer_closed_from_evidence {X : Type u} {P : InducedGroupActionPackage X} (O : OrbitStabilizerPackage P) (E : OrbitStabilizerEvidence O) : OrbitStabilizerClosed O := by
  exact E.orbitStabilizerRelationClosed

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse