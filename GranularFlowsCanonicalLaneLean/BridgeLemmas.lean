import GranularFlowsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

end GranularFlowsCanonicalLaneLean
end HautevilleHouse