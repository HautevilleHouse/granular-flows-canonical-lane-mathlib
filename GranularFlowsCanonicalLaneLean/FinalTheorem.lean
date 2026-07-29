import GranularFlowsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

def ConstrainedGranularFlowsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_granular_flows_endgame (A : AdmissibleClass) :
    ConstrainedGranularFlowsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GranularFlowsCanonicalLaneLean
end HautevilleHouse
