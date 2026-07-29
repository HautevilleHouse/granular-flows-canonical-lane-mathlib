import GranularFlowsCanonicalLaneLean.GranularFlowModels

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure HerschelBulkleyParams where
  yieldStress : ℝ
  consistency : ℝ
  flowIndex : ℝ

def regularizedHerschelBulkley (τ : ℝ) (γ : ℝ) (p : HerschelBulkleyParams) : ℝ :=
  if τ ≤ p.yieldStress then 0 else p.consistency * (γ - p.yieldStress)^p.flowIndex

def herschelBulkleyBridgeClosed (p : HerschelBulkleyParams) : Prop :=
  p.consistency > 0 ∧ p.flowIndex > 0 ∧ p.yieldStress ≥ 0

theorem herschel_bulkley_params_positive (p : HerschelBulkleyParams)
    (h : herschelBulkleyBridgeClosed p) : p.consistency > 0 := by
  exact h.1

end GranularFlowsCanonicalLaneLean
end HautevilleHouse