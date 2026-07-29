import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GranularFlowsCanonicalLaneLean.GranularFlowAnalyticCertificate

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

def GranularFlowAdmittedAnalyticClosure : Prop :=
  GranularFlowAnalyticCertificateClosed sourceGranularFlowAnalyticCertificate ∧
  ConstrainedTheoremClosure granularFlowAdmissibleClass

def UnrestrictedClassicalGranularFlowBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedGranularFlowStackCarried = true

theorem granular_flow_admitted_analytic_closure_checked :
    GranularFlowAdmittedAnalyticClosure := by
  exact And.intro source_granular_flow_analytic_certificate_closed
    (constrained_theorem_closure granularFlowAdmissibleClass)

theorem unrestricted_classical_granular_flow_boundary_carried_checked :
    UnrestrictedClassicalGranularFlowBoundaryCarried := by
  exact And.intro rfl rfl

end GranularFlowsCanonicalLaneLean
end HautevilleHouse