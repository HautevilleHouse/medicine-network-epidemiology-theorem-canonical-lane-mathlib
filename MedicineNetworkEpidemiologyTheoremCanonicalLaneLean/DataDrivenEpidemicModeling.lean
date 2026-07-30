import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNetworkEpidemiologyTheoremCanonicalLaneLean.NetworkContactStructure

namespace HautevilleHouse
namespace MedicineNetworkEpidemiologyTheoremCanonicalLaneLean

structure DataDrivenEpidemicModel (N : ContactNetwork) where
  empiricalContactData : Prop
  parameterEstimation : Prop
  modelCalibration : Prop
  forecastingHorizon : Prop
  uncertaintyQuantification : Prop
  empiricalContactDataTerm : empiricalContactData
  parameterEstimationTerm : parameterEstimation
  modelCalibrationTerm : modelCalibration
  forecastingHorizonTerm : forecastingHorizon
  uncertaintyQuantificationTerm : uncertaintyQuantification

structure DataDrivenEpidemicModelingPackage (N : ContactNetwork) (D : DataDrivenEpidemicModel N) where
  predictionAccuracy : Prop
  sensitivityAnalysis : Prop
  interventionImpactAssessment : Prop
  robustnessToMissingData : Prop
  realTimeSurveillance : Prop

structure DataDrivenEpidemicModelingEvidence (N : ContactNetwork) (D : DataDrivenEpidemicModel N) (P : DataDrivenEpidemicModelingPackage N D) where
  predictionAccuracyClosed : P.predictionAccuracy
  sensitivityAnalysisClosed : P.sensitivityAnalysis
  interventionImpactAssessmentClosed : P.interventionImpactAssessment
  robustnessToMissingDataClosed : P.robustnessToMissingData
  realTimeSurveillanceClosed : P.realTimeSurveillance

def DataDrivenEpidemicModelingClosed (N : ContactNetwork) (D : DataDrivenEpidemicModel N) (P : DataDrivenEpidemicModelingPackage N D) : Prop :=
  P.predictionAccuracy ∧ P.sensitivityAnalysis ∧ P.interventionImpactAssessment ∧ P.robustnessToMissingData ∧ P.realTimeSurveillance

theorem data_driven_epidemic_modeling_closed_from_evidence (N : ContactNetwork) (D : DataDrivenEpidemicModel N) (P : DataDrivenEpidemicModelingPackage N D) (E : DataDrivenEpidemicModelingEvidence N D P) : DataDrivenEpidemicModelingClosed N D P := by
  exact And.intro E.predictionAccuracyClosed (And.intro E.sensitivityAnalysisClosed (And.intro E.interventionImpactAssessmentClosed (And.intro E.robustnessToMissingDataClosed E.realTimeSurveillanceClosed)))

end MedicineNetworkEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse