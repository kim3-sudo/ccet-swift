//
//  EvaluationView.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import SwiftUI

struct EvaluationView: View {
    var body: some View {
        Group {
            Text("To begin the test, tap Next below.");
            Text("Once you begin the test, you cannot go back.");
        }
        Group {
            NavigationView {
                NavigationLink(destination: ReactionBrief()) {
                    Text("Next");
                }
            }
        }
    }
}

struct ReactionBrief: View {
    var body: some View {
        Group {
            Text("Reaction Time Evaluation")
                .font(.title);
        }
        Spacer();
        Group {
            Text("When you tap Next, you'll see a series of white dots on a black screen. Tap each dot as quickly as possible. The old dot won't go away until you tap on it.");
        }
        Spacer();
        Group {
            Button(action: {
                print("Begin reaction test");
                // Start a stopwatch
            }) {
                Text("Next");
            }
        }
    }
}

struct ReactionTest: View {
    var body: some View {
        Group {
            // Put reaction test elements here
            
        }
    }
}

struct EvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationView()
    }
}
