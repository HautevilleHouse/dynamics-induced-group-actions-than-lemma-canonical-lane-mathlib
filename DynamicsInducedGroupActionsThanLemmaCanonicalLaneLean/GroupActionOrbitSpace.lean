import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure GroupActionOrbitSpacePackage where
  group : Type u
  groupMultiplication : group → group → group
  groupIdentity : group
  groupInverse : group → group
  groupLaws : groupMultiplication ∘ λ (p : group × group) => (p.1, p.2) = groupMultiplication ∘ λ (p : group × group) => (p.1, p.2)
  actionOnSpace : group → Type v → Type v
  actionCompatibility : ∀ (g1 g2 : group) (x : Type v), actionOnSpace (groupMultiplication g1 g2) x = actionOnSpace g1 (actionOnSpace g2 x)
  actionIdentity : ∀ (x : Type v), actionOnSpace groupIdentity x = x
  orbitSpace : Type w
  orbitSpaceProjection : Type v → orbitSpace
  orbitSpaceOpen : Prop
  orbitSpaceHausdorff : Prop
  orbitSpaceCompact : Prop

structure GroupActionOrbitSpaceEvidence (P : GroupActionOrbitSpacePackage) where
  orbitSpaceOpenClosed : P.orbitSpaceOpen
  orbitSpaceHausdorffClosed : P.orbitSpaceHausdorff
  orbitSpaceCompactClosed : P.orbitSpaceCompact

def GroupActionOrbitSpaceClosed (P : GroupActionOrbitSpacePackage) : Prop :=
  P.orbitSpaceOpen ∧ P.orbitSpaceHausdorff ∧ P.orbitSpaceCompact

theorem group_action_orbit_space_closed_from_evidence (P : GroupActionOrbitSpacePackage) (E : GroupActionOrbitSpaceEvidence P) : GroupActionOrbitSpaceClosed P := by
  exact And.intro E.orbitSpaceOpenClosed (And.intro E.orbitSpaceHausdorffClosed E.orbitSpaceCompactClosed)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse
