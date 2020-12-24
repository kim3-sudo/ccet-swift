//
//  AboutView.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text("After crashing, cyclists are all too eager to hop back on their bike without being evaluated for a concussion, even if there's a possibility that their head might have experienced a traumatic event. For obvious reasons, this behavior is quite dangerous, and in amateur cycling, the dangers are amplified by the very fact that cycling is very much an individual sport - there's no sports medicine staff readily available and trailing behind on every training ride to evaluate concussions like those in the pro peloton get.");
                Spacer();
                Text("This is a preliminary, work-in-progress, fledgling, side-project app to solve a problem that I haven't found a good solution for. Sure, concussion testing apps exist, but they don't really function well for long-term cognitive tracking, marking distinct events (like crashes), or setting new baselines at different activity levels - adrenaline makes the brain behave differently than when at rest.");
                Spacer();
                Text("Made with ♥ in Gambier, Ohio.")
                    .multilineTextAlignment(.center);
            }
            .padding(10.0)
        }
        .navigationBarTitle("About this app")
    }
}

struct AboutEvaluationView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
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
            .padding(10.0)
        }
        .navigationBarTitle("About the evaluation modes")
    }
}

struct DisclaimerView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Spacer();
                Text("This app and its data are not intended to and cannot replace the expertise of a medical professional. If you suspect that you may have suffered a concussion, you should always seek medical help and have a proper examination to determine whether damage from some traumatic brain event has occurred.");
                Spacer();
            }
            .padding(10.0)
        }
        .navigationBarTitle("Disclaimer")
    }
}

struct AboutEvaluations: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Spacer();
                Group {
                    Text("Reaction Test")
                        .font(.title2);
                    Spacer();
                    Text("This test is designed to evaluate the user's reaction time. A low reaction time is good, and it means that the brain is making quick judgements and is still able to control fine motor skills (within the fingers). Lower times are better, which equates to a higher score.");
                }
                Group {
                    Text("Short-Term Memory Recall Test")
                        .font(.title2);
                    Spacer();
                    Text("This test is designed to evaluate short-term memory recall skills. The user is presented with a sentence, then must recall simple information from that sentence. In this test, both time and accuracy are judged. If a user answers quickly and correctly, they are likely still able to make decisions. If a user answers slowly but correctly, their fine motor skills may be impaired. If a user answers incorrectly, their memory skills may be impaired. More correct answers and lower answering times equates to a higher score.");
                }
                Group {
                    Text("Gross Motor Skill Test")
                        .font(.title2);
                    Spacer();
                    Text("This test is designed to evaluate whether the user still maintains gross motor skills. The user must balance a virtual ball on a target for ten seconds. The longer the user is able to hold the ball in the target zone, the better the score.")
                }
            }
            .padding(10.0)
        }
        .navigationBarTitle("About the tests")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
