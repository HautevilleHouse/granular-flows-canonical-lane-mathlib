import GranularFlowsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

def ConstrainedGranularFlowClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_granular_flow_closure (A : AdmissibleClass) :
    ConstrainedGranularFlowClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GranularFlowsCanonicalLaneLean
end HautevilleHouse