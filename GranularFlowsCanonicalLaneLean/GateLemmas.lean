import GranularFlowsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end GranularFlowsCanonicalLaneLean
end HautevilleHouse