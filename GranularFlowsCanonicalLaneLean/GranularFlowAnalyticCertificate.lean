import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GranularFlowsCanonicalLaneLean.RegularityEndpointLayer

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure GranularFlowAnalyticCertificate where
  substrate : MathlibPDESubstrate
  operatorsClosed : Prop
  weakLayerClosed : Prop
  energyLayerClosed : Prop
  compactnessLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  weakLayerClosedProof : weakLayerClosed
  energyLayerClosedProof : energyLayerClosed
  compactnessLayerClosedProof : compactnessLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceGranularFlowAnalyticCertificate : GranularFlowAnalyticCertificate := {
  substrate := mathlibPDESubstrate
  operatorsClosed := GranularFlowEquationClosed sourceGranularFlow
  weakLayerClosed := KineticTheoryEnvelopeClosed sourceKineticTheoryEnvelope
  energyLayerClosed := EnergyDissipationClosed sourceEnergyDissipationCertificate
  compactnessLayerClosed := CompactnessRigidityClosed sourceCompactnessRigidityCertificate
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  canonicalCarriageImported := commonCoreProjectionLawAvailable ∧ commonCoreCarriageLawAvailable ∧ commonCoreIdempotenceAvailable
  operatorsClosedProof := source_granular_flow_equation_closed_checked
  weakLayerClosedProof := source_kinetic_theory_envelope_closed
  energyLayerClosedProof := source_energy_dissipation_closed
  compactnessLayerClosedProof := source_compactness_rigidity_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
  canonicalCarriageImportedProof := And.intro mathlib_common_core_projection_law_checked
    (And.intro mathlib_common_core_carriage_law_checked mathlib_common_core_idempotence_checked)
}

def GranularFlowAnalyticCertificateClosed (C : GranularFlowAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.weakLayerClosed ∧
  C.energyLayerClosed ∧
  C.compactnessLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_granular_flow_analytic_certificate_closed :
    GranularFlowAnalyticCertificateClosed sourceGranularFlowAnalyticCertificate := by
  exact And.intro sourceGranularFlowAnalyticCertificate.operatorsClosedProof
    (And.intro sourceGranularFlowAnalyticCertificate.weakLayerClosedProof
      (And.intro sourceGranularFlowAnalyticCertificate.energyLayerClosedProof
        (And.intro sourceGranularFlowAnalyticCertificate.compactnessLayerClosedProof
          (And.intro sourceGranularFlowAnalyticCertificate.endpointLayerClosedProof
            sourceGranularFlowAnalyticCertificate.canonicalCarriageImportedProof))))

end GranularFlowsCanonicalLaneLean
end HautevilleHouse