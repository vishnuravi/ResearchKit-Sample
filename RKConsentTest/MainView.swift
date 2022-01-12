//
//  MainView.swift
//  RKConsentTest
//
//  Created by Vishnu Ravi on 1/12/22.
//

import SwiftUI

struct MainView: View {
    @State private var showingOnboarding = false
    @State private var showingSurvey = false
    @State private var showingTask = false
    
    var body: some View {
//        TabView {
//            OnboardingViewController()
//                .tabItem {
//                    Label("Consent", systemImage: "signature")
//                }
//
//            SurveyViewController()
//                .tabItem {
//                    Label("Survey", systemImage: "doc.on.clipboard")
//                }
//            ActiveTaskViewController()
//                .tabItem {
//                    Label("Tapping", systemImage: "hand.point.up.left")
//                }
//        }
        
        VStack{
            Spacer()
            
            Button("Onboarding"){
                showingOnboarding.toggle()
            }
            .foregroundColor(Color.white)
            .font(.title)
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .sheet(isPresented: $showingOnboarding){
                OnboardingViewController()
            }
            
            Spacer()
            
            Button("Survey"){
                showingSurvey.toggle()
            }
            .foregroundColor(Color.white)
            .font(.title)
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .sheet(isPresented: $showingSurvey){
                SurveyViewController()
            }
            
            Spacer()
            
            Button("Active Task"){
                showingTask.toggle()
            }
            .foregroundColor(Color.white)
            .font(.title)
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .sheet(isPresented: $showingTask){
                ActiveTaskViewController()
            }
            
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
