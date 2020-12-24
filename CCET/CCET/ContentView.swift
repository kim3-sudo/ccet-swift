//
//  ContentView.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                Form {
                    Group {
                        Text("Cyclist's Concussion Evaluation Tool")
                            .font(.title)
                            .padding(.leading, 10.0);
                        Text("Choose an evaluation mode")
                            .font(.title2)
                            .padding(.leading, 10.0);
                    }
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
            .tabItem {
                Image(systemName: "bolt");
                Text("Evaluate");
            }
            NavigationView {
                List (0..<5) { item in
                    Image(systemName: "bookmark");
                    VStack (alignment: .leading) {
                        NavigationLink(destination: ResultsView()) {
                            Text("Resting Baseline");
                            Text("2309")
                                .font(.subheadline);
                        }
                    }
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
                        NavigationLink(destination: AboutEvaluations()) {
                            Text("About the tests");
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

struct EvaluationView: View {
    var body: some View {
        Group {
            Text("To begin the test, tap Next below. Once you begin the test, you cannot go back.")
            NavigationView {
                NavigationLink(destination: ReactionBrief()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

struct ReactionBrief: View {
    var body: some View {
        Group {
            Text("Reaction Time Evaluation")
                .font(.title)
        }
        Spacer()
        Group {
            Text("When you tap Next, you'll see a series of white dots on a black screen. Tap each dot as quickly as possible. The old dot won't go away until you tap on it.")
        }
        Spacer()
        Group {
            NavigationView {
                NavigationLink(destination: ReactionTest()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

struct ReactionTest: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
        }
        // Remove after this section complete.
        // This section provided only for worfklow reasons
        Group {
            NavigationView {
                NavigationLink(destination: STMRBrief()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
        // Up to here
    }
}

struct STMRBrief: View {
    var body: some View {
        Group {
            Text("Short-Term Memory Recall Evaluation")
                .font(.title)
        }
        Spacer()
        Group {
            Text("When you tap Next, you'll see one sentence. After you think you've memorized the name, type of bike, and brand of bike that are described in the sentence, you'll then be asked to recall one of those facts. There are a total of three sentences.")
        }
        Spacer()
        Group {
            NavigationView {
                NavigationLink(destination: STMRTestSentence()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
    }
}

struct STMRTestSentence: View {
    var body: some View {
        Group {
            // Put STMR test elements here
            Text("Simon rode his Orbea time-trial bike.")
        }
        Group {
            NavigationView {
                NavigationLink(destination: STMRTestRecall()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
    }
}

struct STMRTestRecall: View {
    var body: some View {
        Group {
            // Put STMR test elements here
            // Prompt
            Text("What kind of bike did Simon ride?")
            // Multiple choices
            Form {
                Text("time-trial")
                Text("cyclocross")
                Text("e-bike")
            }
        }
        Group {
            NavigationView {
                NavigationLink(destination: GMSBrief()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
    }
}

struct GMSBrief: View {
    var body: some View {
        Group {
            Text("Gross Motor Skills Evaluation")
                .font(.title)
        }
        Spacer()
        Group {
            Text("When you tap Next, you'll see a prompt to hold your device flat, then you'll be asked to keep a virtual ball on top of a target by balancing your device.")
        }
        Spacer()
        Group {
            NavigationView {
                NavigationLink(destination: GMSTestPrompt()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
    }
}

struct GMSTestPrompt: View {
    var body: some View {
        Group {
            // Put GMS test prompt elements here
            Text("Hold your device flat with two hands on either end as shown below. When you're ready, tap Next.")
        }
        Group {
            NavigationView {
                NavigationLink(destination: GMSTest()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
    }
}

struct GMSTest: View {
    var body: some View {
        Group {
            // Put GMS test elements here
            
        }
        Group {
            NavigationView {
                NavigationLink(destination: Results()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
    }
}

struct Results: View {
    var body: some View {
        Group {
            // Put GMS test elements here
            Form {
                Text("Test Date: ");
                Text("Test Type: ");
                Text("Reaction Time Result");
                Text("Short-Term Memory Recall Result");
                Text("Gross Motor Skills Result");
                Text("Final Score: ");
            }
        }
        Group {
            Text("You can also access this information later in your Results.");
        }
        Group {
            NavigationView {
                NavigationLink(destination: ContentView()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            }
        }
    }
}

struct ResultsView: View {
    var body: some View {
        Form {
            Text("Test Date: ");
            Text("Test Type: ");
            Text("Reaction Time Result");
            Text("Short-Term Memory Recall Result");
            Text("Gross Motor Skills Result");
            Text("Final Score: ");
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
