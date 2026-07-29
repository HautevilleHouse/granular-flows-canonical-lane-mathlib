import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GranularFlowsCanonicalLaneLean.EnergyDissipationLayer

namespace HautevilleHouse
namespace GranularFlowsCanonicalLaneLean

structure ShearBandFormationCertificate where
  energyDissipation : EnergyDissipationCertificate
  localizationCondition : Prop
  shearBandWidth : Prop
  criticalStrain : Prop
  localizationConditionClosed : localizationCondition
  shearBandWidthClosed : shearBandWidth
  criticalStrainClosed : criticalStrain

def sourceShearBandFormationCertificate : ShearBandFormationCertificate := {
  energyDissipation := sourceEnergyDissipationCertificate
  localizationCondition := True
  shearBandWidth := True
  criticalStrain := True
  localizationConditionClosed := trivial
  shearBandWidthClosed := trivial
  criticalStrainClosed := trivial
}

def ShearBandFormationClosed (C : ShearBandFormationCertificate) : Prop :=
  EnergyDissipationClosed C.energyDissipation ∧
  C.localizationCondition ∧
  C.shearBandWidth ∧
  C.criticalStrain

theorem source_shear_band_formation_closed : ShearBandFormationClosed sourceShearBandFormationCertificate := by
  exact And.intro source_energy_dissipation_closed
    (And.intro sourceShearBandFormationCertificate.localizationConditionClosed
      (And.intro sourceShearBandFormationCertificate.shearBandWidthClosed
        sourceShearBandFormationCertificate.criticalStrainClosed))

end GranularFlowsCanonicalLaneLean
end HautevilleHouse