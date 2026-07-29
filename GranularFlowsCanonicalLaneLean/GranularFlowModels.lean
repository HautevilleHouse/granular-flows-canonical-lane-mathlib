import GranularFlowsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

abbrev Time := ℝ
abbrev Stress := ℝ
abbrev StrainRate := ℝ
abbrev PackingFraction := ℝ

structure GranularFlow where
  shearStress : Time → Stress
  strainRate : Time → StrainRate
  packingFraction : Time → PackingFraction
  dilationAngle : ℝ

def zeroGranularFlow : GranularFlow := {
  shearStress := fun _ => 0
  strainRate := fun _ => 0
  packingFraction := fun _ => 0.5
  dilationAngle := 0
}

structure GranularRheology where
  frictionCoeff : PackingFraction → ℝ
  criticalState : Prop
  flowRule : Prop

def criticalState (g : GranularFlow) : Prop :=
  g.strainRate 0 = 0

end GranularFlowsCanonicalLaneLean
end HautevilleHouse