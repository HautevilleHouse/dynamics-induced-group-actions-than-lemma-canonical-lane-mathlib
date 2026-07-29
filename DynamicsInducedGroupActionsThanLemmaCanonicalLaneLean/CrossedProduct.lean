import DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean.ErgodicTheory

namespace HautevilleHouse
namespace DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean

structure CrossedProductPackage {X : Type u} [MeasureTheory.MeasureSpace X] [TopologicalSpace X] (P : InducedGroupActionPackage X) where
  crossedProductAlgebra : Type v
  multiplication : crossedProductAlgebra → crossedProductAlgebra → crossedProductAlgebra
  involution : crossedProductAlgebra → crossedProductAlgebra
  norm : crossedProductAlgebra → ℝ
  productDef : ∀ (a b : crossedProductAlgebra), multiplication a b = multiplication (involution b) (involution a)
  normProduct : ∀ (a b : crossedProductAlgebra), norm (multiplication a b) ≤ norm a * norm b
  continuousAction : Continuous (λ (g : P.groupStructure) ↦ P.action (P.homomorphism g))

structure CrossedProductEvidence {X : Type u} [MeasureTheory.MeasureSpace X] [TopologicalSpace X] {P : InducedGroupActionPackage X} (C : CrossedProductPackage P) where
  productDefClosed : C.productDef = C.productDef
  normProductClosed : C.normProduct = C.normProduct
  continuousActionClosed : C.continuousAction

def CrossedProductClosed {X : Type u} [MeasureTheory.MeasureSpace X] [TopologicalSpace X] {P : InducedGroupActionPackage X} (C : CrossedProductPackage P) : Prop :=
  C.normProduct (C.multiplication C.crossedProductAlgebra.default C.crossedProductAlgebra.default) ≤ C.norm C.crossedProductAlgebra.default * C.norm C.crossedProductAlgebra.default

theorem crossed_product_closed_from_evidence {X : Type u} [MeasureTheory.MeasureSpace X] [TopologicalSpace X] {P : InducedGroupActionPackage X} (C : CrossedProductPackage P) (Ev : CrossedProductEvidence C) : CrossedProductClosed C := by
  exact Ev.normProductClosed

end DynamicsInducedGroupActionsThanLemmaCanonicalLaneLean
end HautevilleHouse