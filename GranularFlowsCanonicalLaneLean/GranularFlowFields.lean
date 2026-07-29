import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure GrainProperties where
  diameter : ℝ
  density : ℝ
  restitutionCoefficient : ℝ
  frictionCoefficient : ℝ

def defaultGrainProperties : GrainProperties := {
  diameter := 1.0
  density := 1.0
  restitutionCoefficient := 0.5
  frictionCoefficient := 0.3
}

structure GranularFlowState where
  solidFraction : ScalarField
  velocity : VectorField
  granularTemperature : ScalarField
  stressTensor : VectorField → VectorField

def zeroSolidFraction : ScalarField := fun _ _ => 0.0
def zeroGranularTemperature : ScalarField := fun _ _ => 0.0

def defaultFlowState : GranularFlowState := {
  solidFraction := zeroSolidFraction
  velocity := fun _ _ _ => 0.0
  granularTemperature := zeroGranularTemperature
  stressTensor := fun u => u
}

structure ConstitutiveRelations where
  pressure : ScalarField → ScalarField
  viscosity : ScalarField → ScalarField → ScalarField
  conductivity : ScalarField → ScalarField
  dissipationRate : ScalarField → ScalarField

def defaultConstitutive : ConstitutiveRelations := {
  pressure := fun phi => phi
  viscosity := fun phi _ => phi
  conductivity := fun phi => phi
  dissipationRate := fun phi => phi
}

def massBalance (phi : ScalarField) (u : VectorField) : ScalarField := fun t x => 0.0

def momentumBalance (phi : ScalarField) (u : VectorField) (theta : ScalarField) : VectorField := fun t x _ => 0.0

def energyBalance (phi : ScalarField) (u : VectorField) (theta : ScalarField) : ScalarField := fun t x => 0.0

end GranularFlowsCanonicalLaneLean
end HautevilleHouse