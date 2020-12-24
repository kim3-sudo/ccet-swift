//
//  AboutEvaluationView.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import SwiftUI

struct AboutEvaluationView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Group {
                    Text("About the evaluation modes")
                        .font(.title);
                }
                Spacer();
                Group {
                    Text("Crash concussion test")
                        .font(.title2);
                    Text("After a crash, evaluate cognitive performance and compare results against baseline results to determine if you may need to stop your ride and seek medical attention.");
                }
                Spacer();
                Group {
                    Text("Resting baseline")
                        .font(.title2);
                    Text("While you're calm and in a quiet place (like at home), run a resting baseline test to establish a resting baseline score. You should run a resting baseline test routinely.");
                }
                Spacer();
                Group {
                    Text("Active baseline")
                        .font(.title2);
                    Text("After you've engaged in heavy physical activity, like a ride, run an active baseline test to establish an active baseline score. While you have adrenaline and endorphines running through your system, your score will likely be elevated compared to your resting baseline score. You should run an active baseline test routinely.");
                }
                Spacer();
                Group {
                    Text("Dry run")
                        .font(.title2);
                    Text("Want to get a feel for what a test feels like? You can do a dry run to see what the tests are without recording the score.");
                }
                Spacer();
            }
        }
    }
}

struct AboutEvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        AboutEvaluationView()
    }
}
