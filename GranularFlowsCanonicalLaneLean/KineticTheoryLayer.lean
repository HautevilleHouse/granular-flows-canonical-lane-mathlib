import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GranularFlowsCanonicalLaneLean.GranularFlowFields

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure KineticTheoryEnvelope where
  flow : GranularFlowState
  grainProps : GrainProperties
  radialDistributionFunction : ScalarField
  collisionFrequency : ScalarField
  radialDistributionClosed : radialDistributionFunction = zeroSolidFraction
  collisionFrequencyClosed : collisionFrequency = zeroSolidFraction

def sourceKineticTheoryEnvelope : KineticTheoryEnvelope := {
  flow := defaultFlowState
  grainProps := defaultGrainProperties
  radialDistributionFunction := zeroSolidFraction
  collisionFrequency := zeroSolidFraction
  radialDistributionClosed := rfl
  collisionFrequencyClosed := rfl
}

def KineticTheoryEnvelopeClosed (E : KineticTheoryEnvelope) : Prop :=
  E.radialDistributionFunction = zeroSolidFraction ∧
  E.collisionFrequency = zeroSolidFraction

theorem source_kinetic_theory_envelope_closed : KineticTheoryEnvelopeClosed sourceKineticTheoryEnvelope := by
  exact And.intro sourceKineticTheoryEnvelope.radialDistributionClosed sourceKineticTheoryEnvelope.collisionFrequencyClosed

end GranularFlowsCanonicalLaneLean
end HautevilleHouse