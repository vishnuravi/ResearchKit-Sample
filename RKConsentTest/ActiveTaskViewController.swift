//
//  OnboardingViewController.swift
//  CardinalKit_Example
//
//  Created by Surabhi Mundada on 1/12/22.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import SwiftUI
import UIKit
import ResearchKit

struct ActiveTaskViewController: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> ActiveTaskViewCoordinator {
        ActiveTaskViewCoordinator()
    }
    
    func updateUIViewController(_ taskViewController: ORKTaskViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let sampleTappingTask: ORKOrderedTask = {
            let intendedUseDescription = "Finger tapping is a universal way to communicate."
            
            return ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "TappingTask", intendedUseDescription: intendedUseDescription, duration: 10, handOptions: .both, options: ORKPredefinedTaskOption())
        }()
        let taskViewController = ORKTaskViewController(task: sampleTappingTask, taskRun: nil)
        taskViewController.delegate = context.coordinator
        
        // & present the VC!
        return taskViewController
    }
    
}
