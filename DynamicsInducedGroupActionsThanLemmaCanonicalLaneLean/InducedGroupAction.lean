import DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure InducedGroupActionPackage (X : Type u) where
  domain : Type v
  action : domain → X → X
  groupStructure : Type w
  groupMul : groupStructure → groupStructure → groupStructure
  groupInv : groupStructure → groupStructure
  groupUnit : groupStructure
  homomorphism : groupStructure → (X → X)
  actionGroupLaw : ∀ (g h : groupStructure) (x : X), action (homomorphism (groupMul g h)) x = action (homomorphism g) (action (homomorphism h) x)
  identityLaw : ∀ (x : X), action (homomorphism groupUnit) x = x

structure InducedGroupActionEvidence {X : Type u} (P : InducedGroupActionPackage X) where
  groupStructureClosed : P.groupStructure = P.groupStructure
  homomorphismInjective : Function.Injective P.homomorphism

def InducedGroupActionClosed {X : Type u} (P : InducedGroupActionPackage X) : Prop :=
  ∃ (inv : ∀ g : P.groupStructure, P.action (P.homomorphism (P.groupInv g)) = (P.action (P.homomorphism g))⁻¹), True

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse