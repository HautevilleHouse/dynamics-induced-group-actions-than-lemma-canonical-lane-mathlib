import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure CocycleRigidityPackage {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  (D : DynamicsInducedGroupActionPackage G X) where
  cocycleSpace : Type w
  coboundaryCondition : Prop
  rigidityClass : Prop
  vanishingTheorem : Prop

structure CocycleRigidityEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (C : CocycleRigidityPackage D) where
  coboundaryConditionClosed : C.coboundaryCondition
  rigidityClassClosed : C.rigidityClass
  vanishingTheoremClosed : C.vanishingTheorem

def CocycleRigidityClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (C : CocycleRigidityPackage D) : Prop :=
  C.coboundaryCondition ∧ C.rigidityClass ∧ C.vanishingTheorem

theorem cocycle_rigidity_closed_from_evidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {D : DynamicsInducedGroupActionPackage G X} (C : CocycleRigidityPackage D)
  (E : CocycleRigidityEvidence C) : CocycleRigidityClosed C :=
by
  exact And.intro E.coboundaryConditionClosed (And.intro E.rigidityClassClosed E.vanishingTheoremClosed)

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse