import canonicalLaneMathlib.AdmissibleClass
import GranularFlowsCanonicalLaneLean.GranularFlowOperators

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure RheologyCertificate where
  flow : GranularFlow
  yieldStressProp : Prop
  frictionLawProp : Prop
  dilationProp : Prop
  yieldStressClosed : yieldStressProp
  frictionLawClosed : frictionLawProp
  dilationClosed : dilationProp

def sourceRheologyCertificate : RheologyCertificate := {
  flow := primitiveFlow
  yieldStressProp := Incompressible primitiveFlow
  frictionLawProp := DragBalance primitiveFlow
  dilationProp := AnalyticBalance primitiveFlow
  yieldStressClosed := primitive_flow_incompressible_checked
  frictionLawClosed := primitive_flow_drag_balance_checked
  dilationClosed := primitive_flow_analytic_balance_checked
}

def RheologyClosed (C : RheologyCertificate) : Prop :=
  C.yieldStressProp ∧ C.frictionLawProp ∧ C.dilationProp

theorem source_rheology_closed :
    RheologyClosed sourceRheologyCertificate := by
  exact And.intro sourceRheologyCertificate.yieldStressClosed
    (And.intro sourceRheologyCertificate.frictionLawClosed
      sourceRheologyCertificate.dilationClosed)

end GranularFlowsCanonicalLaneLean
end HautevilleHouse