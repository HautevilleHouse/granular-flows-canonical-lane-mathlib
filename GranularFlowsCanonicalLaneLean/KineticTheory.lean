import GranularFlowsCanonicalLaneLean.GranularFlowModels

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure KineticTheoryParams where
  particleDensity : ℝ
  restitutionCoeff : ℝ
  granularTemperature : ℝ

def granularTemperatureEquation (g : GranularFlow) (k : KineticTheoryParams) : Prop :=
  k.granularTemperature = g.strainRate 0^2 * (1 - k.restitutionCoeff^2)

def bridgeClosed (A : AdmissibleClass) : Prop := NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

end GranularFlowsCanonicalLaneLean
end HautevilleHouse