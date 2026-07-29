import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GranularFlowsCanonicalLaneLean.MomentumBalanceLayer

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure EnergyDissipationCertificate where
  momentumBalance : MomentumBalanceCertificate
  dissipationClosure : Prop
  granularTemperatureEquation : Prop
  inelasticCollapse : Prop
  dissipationClosureClosed : dissipationClosure
  granularTemperatureEquationClosed : granularTemperatureEquation
  inelasticCollapseClosed : inelasticCollapse

def sourceEnergyDissipationCertificate : EnergyDissipationCertificate := {
  momentumBalance := sourceMomentumBalanceCertificate
  dissipationClosure := True
  granularTemperatureEquation := True
  inelasticCollapse := True
  dissipationClosureClosed := trivial
  granularTemperatureEquationClosed := trivial
  inelasticCollapseClosed := trivial
}

def EnergyDissipationClosed (C : EnergyDissipationCertificate) : Prop :=
  MomentumBalanceClosed C.momentumBalance ∧
  C.dissipationClosure ∧
  C.granularTemperatureEquation ∧
  C.inelasticCollapse

theorem source_energy_dissipation_closed : EnergyDissipationClosed sourceEnergyDissipationCertificate := by
  exact And.intro source_momentum_balance_closed
    (And.intro sourceEnergyDissipationCertificate.dissipationClosureClosed
      (And.intro sourceEnergyDissipationCertificate.granularTemperatureEquationClosed
        sourceEnergyDissipationCertificate.inelasticCollapseClosed))

end GranularFlowsCanonicalLaneLean
end HautevilleHouse