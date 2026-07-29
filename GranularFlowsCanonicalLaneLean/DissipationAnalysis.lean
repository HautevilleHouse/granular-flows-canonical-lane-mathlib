import canonicalLaneMathlib.AdmissibleClass
import GranularFlowsCanonicalLaneLean.RheologyLayer

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure DissipationCertificate where
  rheology : RheologyCertificate
  energyDissipationProp : Prop
  entropyProductionProp : Prop
  granularTemperatureProp : Prop
  energyDissipationClosed : energyDissipationProp
  entropyProductionClosed : entropyProductionProp
  granularTemperatureClosed : granularTemperatureProp

def sourceDissipationCertificate : DissipationCertificate := {
  rheology := sourceRheologyCertificate
  energyDissipationProp := GranularFlowEquationClosed primitiveFlow
  entropyProductionProp := Incompressible primitiveFlow
  granularTemperatureProp := DragBalance primitiveFlow
  energyDissipationClosed := primitive_flow_equation_closed_checked
  entropyProductionClosed := primitive_flow_incompressible_checked
  granularTemperatureClosed := primitive_flow_drag_balance_checked
}

def DissipationClosed (C : DissipationCertificate) : Prop :=
  RheologyClosed C.rheology ∧
  C.energyDissipationProp ∧
  C.entropyProductionProp ∧
  C.granularTemperatureProp

theorem source_dissipation_closed :
    DissipationClosed sourceDissipationCertificate := by
  exact And.intro source_rheology_closed
    (And.intro sourceDissipationCertificate.energyDissipationClosed
      (And.intro sourceDissipationCertificate.entropyProductionClosed
        sourceDissipationCertificate.granularTemperatureClosed))

end GranularFlowsCanonicalLaneLean
end HautevilleHouse