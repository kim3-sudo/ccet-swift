//
//  ContentView.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import SwiftUI

struct ContentView: View {
    var testMode:String = "";
    var body: some View {
        TabView {
            VStack (alignment: .leading) {
                Text("Cyclist's Concussion Evaluation Tool")
                    .font(.title)
                Spacer()
                Text("Choose an evaluation mode")
                    .font(.title2);
                NavigationView {
                    Form {
                        Section {
                            NavigationLink(destination: EvaluationView()) {
                                Text("Crash Concussion Test")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.red);
                            }
                        }
                        Section {
                            NavigationLink(destination: EvaluationView()) {
                                Text("Resting Baseline");
                            }
                            NavigationLink(destination: EvaluationView()) {
                                Text("Active Baseline");
                            }
                        }
                        Section {
                            NavigationLink(destination: EvaluationView()) {
                                Text("Dry Run");
                            }
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "bolt");
                Text("Evaluate");
            }
            VStack (alignment: .leading) {
                NavigationView {
                    Text("View Results")
                        .font(.title);
                }
            }
            .tabItem {
                Image(systemName: "archivebox");
                Text("Results");
            }
            VStack (alignment: .leading) {
                NavigationView {
                    
                    Form {
                        Text("About CCET")
                            .font(.title)
                            .foregroundColor(.black);
                        NavigationLink(destination: AboutEvaluationView()) {
                            Text("About the evaluation modes");
                        }
                        NavigationLink(destination: AboutView()) {
                            Text("About this app");
                        }
                        NavigationLink(destination: DisclaimerView()) {
                            Text("Disclaimer on suitability for medical applications");
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "info.circle");
                Text("Help");
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
