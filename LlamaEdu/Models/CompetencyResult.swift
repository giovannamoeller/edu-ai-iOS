//
//  CompetencyResult.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 08/11/24.
//

import Foundation

struct Evaluation: Codable {
    let theme: String
    let idEssay: Int
    let totalScore: Int
    let rawFeedback: String
    let competencia1Grade: Int
    let competencia2Grade: Int
    let competencia3Grade: Int
    let competencia4Grade: Int
    let competencia5Grade: Int
    let competencia1Feedback: String
    let competencia2Feedback: String
    let competencia3Feedback: String
    let competencia4Feedback: String
    let competencia5Feedback: String
    
    enum CodingKeys: String, CodingKey {
        case theme,
             idEssay = "id_essay",
             totalScore = "total_score",
             rawFeedback = "raw_feedback",
             competencia1Grade = "competencia_1_grade",
             competencia2Grade = "competencia_2_grade",
             competencia3Grade = "competencia_3_grade",
             competencia4Grade = "competencia_4_grade",
             competencia5Grade = "competencia_5_grade",
             competencia1Feedback = "competencia_1_feedback",
             competencia2Feedback = "competencia_2_feedback",
             competencia3Feedback = "competencia_3_feedback",
             competencia4Feedback = "competencia_4_feedback",
             competencia5Feedback = "competencia_5_feedback"
    }
}

/*struct CompetencyFeedback: Codable, Identifiable {
    var id: Int { competency }  // Use competency as the ID if it's unique
    let grade: Int
    let feedback: Feedback
    let competency: Int
}

struct Feedback: Codable {
    let formalWriting: String?
    let useOfReferences: String?
    let cohesionAndCoherence: String?
    let improvementSuggestions: String?
    let understandingOfTheme: String?
    let argumentativeStructure: String?
    let socioculturalRepertoire: String?
    let selectionAndOrganizationOfInformation: String?
    let viewpointDefense: String?
    let authorshipAndCoherence: String?
    let deepenArguments: String?
    let additionalExamples: String?
    let explorationOfOtherPerspectives: String?
    let ideaArticulation: String?
    let diverseRepertoireOfCohesiveResources: String?
    let interventionProposal: String?
    let proposalDetails: String?
    let humanRightsRespect: String?
    let viabilityAndEthics: String?
    
    enum CodingKeys: String, CodingKey {
        case formalWriting = "formal_writing"
        case useOfReferences = "use_of_references"
        case cohesionAndCoherence = "cohesion_and_coherence"
        case improvementSuggestions = "improvement_suggestions"
        case understandingOfTheme = "understanding_of_theme"
        case argumentativeStructure = "argumentative_structure"
        case socioculturalRepertoire = "sociocultural_repertoire"
        case selectionAndOrganizationOfInformation = "selection_and_organization_of_information"
        case viewpointDefense = "viewpoint_defense"
        case authorshipAndCoherence = "authorship_and_coherence"
        case deepenArguments = "deepen_arguments"
        case additionalExamples = "additional_examples"
        case explorationOfOtherPerspectives = "exploration_of_other_perspectives"
        case ideaArticulation = "idea_articulation"
        case diverseRepertoireOfCohesiveResources = "diverse_repertoire_of_cohesive_resources"
        case interventionProposal = "intervention_proposal"
        case proposalDetails = "proposal_details"
        case humanRightsRespect = "human_rights_respect"
        case viabilityAndEthics = "viability_and_ethics"
    }
}
*/
