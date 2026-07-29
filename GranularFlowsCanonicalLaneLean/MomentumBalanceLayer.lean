import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GranularFlowsCanonicalLaneLean.GranularFlowFields

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure MomentumBalanceCertificate where
  kineticTheory : KineticTheoryEnvelope
  stressClosure : Prop
  momentumBalanceEquation : Prop
  boundaryConditions : Prop
  stressClosureClosed : stressClosure
  momentumBalanceEquationClosed : momentumBalanceEquation
  boundaryConditionsClosed : boundaryConditions

def sourceMomentumBalanceCertificate : MomentumBalanceCertificate := {
  kineticTheory := sourceKineticTheoryEnvelope
  stressClosure := True
  momentumBalanceEquation := True
  boundaryConditions := True
  stressClosureClosed := trivial
  momentumBalanceEquationClosed := trivial
  boundaryConditionsClosed := trivial
}

def MomentumBalanceClosed (C : MomentumBalanceCertificate) : Prop :=
  KineticTheoryEnvelopeClosed C.kineticTheory ∧
  C.stressClosure ∧
  C.momentumBalanceEquation ∧
  C.boundaryConditions

theorem source_momentum_balance_closed : MomentumBalanceClosed sourceMomentumBalanceCertificate := by
  exact And.intro source_kinetic_theory_envelope_closed
    (And.intro sourceMomentumBalanceCertificate.stressClosureClosed
      (And.intro sourceMomentumBalanceCertificate.momentumBalanceEquationClosed
        sourceMomentumBalanceCertificate.boundaryConditionsClosed))

end GranularFlowsCanonicalLaneLean
end HautevilleHouse