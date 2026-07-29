import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

abbrev R := ℝ
abbrev VectorField := Fin 3 → R
abbrev ScalarField := R → R

def zeroVectorField : VectorField := fun _ => 0
def zeroScalarField : ScalarField := fun _ => 0

structure GranularFlowOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  drag : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveOperators : GranularFlowOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  drag := fun _ => zeroVectorField
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
}

structure GranularFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : R
  operators : GranularFlowOperators

def primitiveFlow : GranularFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  viscosity := 1
  operators := primitiveOperators
}

def Incompressible (F : GranularFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def AnalyticBalance (F : GranularFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity

def DragBalance (F : GranularFlow) : Prop :=
  F.operators.drag F.velocity = zeroVectorField

def PressureProjected (F : GranularFlow) : Prop :=
  F.operators.pressureProjection F.velocity = F.velocity

def GranularFlowEquationClosed (F : GranularFlow) : Prop :=
  Incompressible F ∧ AnalyticBalance F ∧ DragBalance F ∧ PressureProjected F

theorem primitive_pressure_projection_idempotent_checked (u : VectorField) :
    primitiveOperators.pressureProjection (primitiveOperators.pressureProjection u) =
      primitiveOperators.pressureProjection u := by
  rfl

theorem primitive_flow_incompressible_checked :
    Incompressible primitiveFlow := by
  rfl

theorem primitive_flow_analytic_balance_checked :
    AnalyticBalance primitiveFlow := by
  rfl

theorem primitive_flow_drag_balance_checked :
    DragBalance primitiveFlow := by
  rfl

theorem primitive_flow_pressure_projected_checked :
    PressureProjected primitiveFlow := by
  rfl

theorem primitive_flow_equation_closed_checked :
    GranularFlowEquationClosed primitiveFlow := by
  exact And.intro primitive_flow_incompressible_checked
    (And.intro primitive_flow_analytic_balance_checked
      (And.intro primitive_flow_drag_balance_checked
        primitive_flow_pressure_projected_checked))

end GranularFlowsCanonicalLaneLean
end HautevilleHouse