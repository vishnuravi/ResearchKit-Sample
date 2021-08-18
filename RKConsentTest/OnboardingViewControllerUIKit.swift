//
//  OnboardingViewController_UIKit.swift
//  RKConsentTest
//
//  Created by Santiago Gutierrez on 8/18/21.
//

import UIKit
import ResearchKit

class OnboardingViewControllerUIKit: ORKTaskViewController {
    
    convenience init() {
        /* **************************************************************
        *  Get user consent
        **************************************************************/
        let Document = ORKConsentDocument()
        Document.title = "Test Consent"

        let sectionTypes: [ORKConsentSectionType] = [
            .overview,
            .dataGathering,
            .privacy,
            .dataUse,
            .timeCommitment,
            .studySurvey,
            .studyTasks,
            .withdrawing
        ]
        
        let consentSections: [ORKConsentSection] = sectionTypes.map { contentSectionType in
            let consentSection = ORKConsentSection(type: contentSectionType)
            consentSection.summary = "Complete the study"
            consentSection.content = "This is a test of the consent process."
            return consentSection
        }
        Document.sections = consentSections
        Document.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "UserSignature"))
        
        let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: Document)
        
        /* **************************************************************
        *  Ask user to review and sign consent document
        **************************************************************/
        // use the `ORKConsentReviewStep` from ResearchKit
        let signature = Document.signatures?.first
        let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: Document)
        reviewConsentStep.text = "Consent Step"
        reviewConsentStep.reasonForConsent = "Reason for Consent"
        
        /* **************************************************************
        *  Inform the user that they are done with onboarding
        **************************************************************/
        // use the `ORKCompletionStep` from ResearchKit
        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
        completionStep.title = "Onboarding Complete"
        completionStep.text = "Onboarding is complete!"
        
        /* **************************************************************
        * Create an array with the steps to show the user
        **************************************************************/
        
        // given intro steps that the user should review and consent to
        let stepsToUse: [ORKStep] = [consentStep, reviewConsentStep, completionStep]
        
        
        /* **************************************************************
        * Show the user these steps
        **************************************************************/
        // create a task with each step
        let orderedTask = ORKOrderedTask(identifier: "StudyOnboardingTask", steps: stepsToUse)
        
        self.init(task: orderedTask, taskRun: nil)
    }
    
}