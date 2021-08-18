//
//  RKConsentTestApp.swift
//  RKConsentTest
//
//  Created by Vishnu Ravi on 8/4/21.
//

import SwiftUI

@main
struct RKConsentTestApp: App {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some Scene {
        WindowGroup {
            Button("Open Consent") {
                self.viewControllerHolder?.present(OnboardingViewControllerUIKit(), animated: true, completion: nil)
            }
        }
    }
}
