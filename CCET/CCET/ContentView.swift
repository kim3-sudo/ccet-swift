//
//  ContentView.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import SwiftUI

struct ContentView: View {
    @State var abbrevResultModels: [AbbrevResultModel] = []
    @State var selectedResultId: Int64 = 0
    var body: some View {
        TabView {
            NavigationView {
                Form {
                    Section (header: Text("Emergency Tests")) {
                        NavigationLink(destination: EvaluationView(exammode: "crash")) {
                            Text("Crash Concussion Test")
                                .fontWeight(.heavy)
                                .foregroundColor(.red);
                        }
                    }
                    Section (header: Text("Baseline Tests")) {
                        NavigationLink(destination: EvaluationView(exammode: "rest")) {
                            Text("Resting Baseline");
                        }
                        NavigationLink(destination: EvaluationView(exammode: "active")) {
                            Text("Active Baseline");
                        }
                    }
                    Section (header: Text("Other Tests")) {
                        NavigationLink(destination: EvaluationView(exammode: "dry")) {
                            Text("Dry Run");
                        }
                    }
                }
                .navigationBarTitle("CCET", displayMode: .inline)
            }
            
            .tabItem {
                Image(systemName: "bolt");
                Text("Evaluate");
            }
            NavigationView {
                VStack {
                    List (self.abbrevResultModels, id:\.id) { (model) in
                        HStack {
                            NavigationLink (destination: ResultsView(idIn: 2)) {
                                Text(model.type)
                                Text(String(model.score.reaction))
                                    .foregroundColor(Color(.systemGray5))
                            }
                        }
                    }
                }
                .navigationBarTitle("Results", displayMode: .inline)
                .onAppear(perform: {
                    self.abbrevResultModels = DB_Manager().GetAbbrevData()
                })
            }
            .tabItem {
                Image(systemName: "archivebox");
                Text("Results");
            }
            VStack (alignment: .leading) {
                NavigationView {
                    Form {
                        Section (header: Text("About")) {
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
                        Section (header: Text("Developer Tools")) {
                            NavigationLink(destination: DeveloperAdd()) {
                                Text("Add Tools");
                            }
                        }
                    }
                    .navigationBarTitle("Help", displayMode: .inline)
                }
            }
            .tabItem {
                Image(systemName: "info.circle");
                Text("Help");
            }
        }
    }
}

struct EvaluationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var exammode: String
    var body: some View {
        VStack {
            Text("To begin the test, tap Next below. Once you begin the test, you cannot stop it.")
        }
        //NavigationView {
            NavigationLink(destination: ReactionBrief(exammode: exammode).navigationBarBackButtonHidden(true)) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10);
                Image(systemName: "chevron.right")
            }
        //}
        .navigationBarTitle("Evaluation View", displayMode: .inline)
    }
}


struct ReactionBrief: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var exammode: String
    var body: some View {
        VStack {
            Text("When you tap Next, you'll see a series of white dots on a black screen. Tap each dot as quickly as possible. The old dot won't go away until you tap on it.")
        }
        //NavigationView {
            NavigationLink(destination: ReactionTest(exammode: exammode).navigationBarBackButtonHidden(true)) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10);
                Image(systemName: "chevron.right")
            }
        //}
        .navigationBarTitle("Reaction Test Instructions", displayMode: .inline)
    }
}

 
struct ReactionTest: View {
    var exammode: String
    var body: some View {
        VStack {
            Color.black
                .ignoresSafeArea()
        }
        // Remove after this section complete.
        // This section provided only for worfklow reasons
        Group {
            //NavigationView {
                NavigationLink(destination: STMRBrief(exammode: exammode, reactionresult: 999).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
                .isDetailLink(false)
            //}
            .navigationBarTitle("Reaction Test", displayMode: .inline)
        }
        // Up to here
    }
}

struct STMRBrief: View {
    var exammode: String
    var reactionresult: Int64
    var body: some View {
        VStack {
            Text("When you tap Next, you'll see one sentence. After you think you've memorized the name, type of bike, and brand of bike that are described in the sentence, you'll then be asked to recall one of those facts. There are a total of three sentences.")
        }
        Group {
            //NavigationView {
                NavigationLink(destination: STMRTestSentence(exammode: exammode, reactionresult: reactionresult).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            //}
            .navigationBarTitle("Short-Term Memory Recall Instructions", displayMode: .inline)
        }
    }
}

struct STMRTestSentence: View {
    var exammode: String
    var reactionresult: Int64
    var body: some View {
        Group {
            Spacer()
            // Put STMR test elements here
            VStack (alignment: .leading) {
                Text("Simon rode his Orbea time-trial bike.")
                    .font(.title)
                    .lineLimit(nil)
            };
        }
        Group {
            //NavigationView {
                NavigationLink(destination: STMRTestRecall(exammode: exammode, reactionresult: reactionresult).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            //}
            .navigationBarTitle("Short-Term Memory Recall Test", displayMode: .inline)
        }
    }
}

struct STMRTestRecall: View {
    var exammode: String
    var reactionresult: Int64
    @State var test1: Int64 = 333
    @State var test2: Int64 = 333
    @State var test3: Int64 = 333
    var stmrresult: Int64 = 999
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
            //NavigationView {
                NavigationLink(destination: GMSBrief(exammode: exammode, reactionresult: reactionresult, stmrresult: stmrresult).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            //}
            .navigationBarTitle("Short-Term Memory Recall", displayMode: .inline)
        }
    }
}

struct GMSBrief: View {
    var exammode: String
    var reactionresult: Int64
    var stmrresult: Int64
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
            //NavigationView {
                NavigationLink(destination: GMSTestPrompt(exammode: exammode, reactionresult: reactionresult, stmrresult: stmrresult).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            //}
            .navigationBarTitle("Gross Motor Skills Instructions", displayMode: .inline)
        }
    }
}

struct GMSTestPrompt: View {
    var exammode: String
    var reactionresult: Int64
    var stmrresult: Int64
    var body: some View {
        Group {
            // Put GMS test prompt elements here
            Text("Hold your device flat with two hands on either end as shown below. When you're ready, tap Next.")
        }
        Group {
            //NavigationView {
                NavigationLink(destination: GMSTest(exammode: exammode, reactionresult: reactionresult, stmrresult: stmrresult).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            //}
            .navigationBarTitle("Gross Motor Skills Preparation", displayMode: .inline)
        }
    }
}

struct GMSTest: View {
    var exammode: String
    var reactionresult: Int64
    var stmrresult: Int64
    
    var gmsresult: Int64 = 999
    var body: some View {
        Group {
            // Put GMS test elements here
            
        }
        Group {
            //NavigationView {
                NavigationLink(destination: Results(exammode: exammode, reactionresult: reactionresult, stmrresult: stmrresult, gmsresult: gmsresult).navigationBarBackButtonHidden(true)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            //}
            .navigationBarTitle("Gross Motor Skills Test", displayMode: .inline)
        }
    }
}

struct Results: View {
    var exammode: String
    var reactionresult: Int64
    var stmrresult: Int64
    var gmsresult: Int64
    var testyear: Int64 = Time_Manager().getYear()
    var testmonth: Int64 = Time_Manager().getMonth()
    var testday: Int64 = Time_Manager().getDay()
    var testhour: Int64 = Time_Manager().getHour()
    var testminute: Int64 = Time_Manager().getMinute()
    var testsecond: Int64 = Time_Manager().getSecond()
    
    var body: some View {
        Group {
            // Put GMS test elements here
            Form {
                Text("Test Date: \(testyear)-\(testmonth)-\(testday) \(testhour):\(testminute):\(testsecond)");
                Text("Test Type: \(exammode)");
                Text("Reaction Time Result: \(reactionresult)");
                Text("Short-Term Memory Recall Result: \(stmrresult)");
                Text("Gross Motor Skills Result: \(gmsresult)");
                Text("Final Score: ");
            }
        }
        Group {
            Text("You can also access this information later in your Results.");
        }
        Group {
            //NavigationView {
                NavigationLink(destination: ContentView()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10);
                    Image(systemName: "chevron.right")
                }
            //}
            .navigationBarTitle("Results", displayMode: .inline)
        }
    }
}

struct ResultsView: View {
    var idIn: Int64
    
    @State var type: String = ""
    @State var year: Int64 = 0
    @State var month: Int64 = 0
    @State var day: Int64 = 0
    @State var hour: Int64 = 0
    @State var minute: Int64 = 0
    @State var second: Int64 = 0
    @State var reaction: Int64 = 0
    @State var stmr: Int64 = 0
    @State var gms: Int64 = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("RESULTS")) {
                    HStack {
                        Text("Test date")
                        Spacer()
                        Text("\(year)-\(month)-\(day)")
                    }
                    HStack {
                        Text("Test time")
                        Spacer()
                        Text("\(hour):\(minute):\(second)")
                    }
                    HStack {
                        Text("Test type")
                        Spacer()
                        Text("\(type) ")
                    }
                    HStack {
                        Text("Reaction score")
                        Spacer()
                        Text("\(reaction) ")
                    }
                    HStack {
                        Text("STMR score")
                        Spacer()
                        Text("\(stmr) ")
                    }
                    HStack {
                        Text("GMS score")
                        Spacer()
                        Text("\(gms) ")
                    }
                }
            }
        }
        .navigationBarTitle(Text("Results View"))
        .onAppear (perform: {
            let resultsModel: ResultModel = DB_Manager().GetDetailedData(idValue: self.idIn)
            
            self.type = resultsModel.type
            self.year = resultsModel.date.year
            self.month = resultsModel.date.month
            self.day = resultsModel.date.day
            self.hour = resultsModel.time.hour
            self.minute = resultsModel.time.minute
            self.second = resultsModel.time.second
            self.reaction = resultsModel.score.reaction
            self.stmr = resultsModel.score.stmr
            self.gms = resultsModel.score.gms
        })
    }
}

struct AboutView: View {
    var body: some View {
        NavigationView {
            Form{
                Section (header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("0.0.2")
                    }
                }
            }
        }
        .navigationBarTitle("About this app", displayMode: .inline)
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
        .navigationBarTitle("About the evaluation modes", displayMode: .inline)
    }
}

struct DisclaimerView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Spacer();
                Text("This app and its data are not intended to and cannot replace the expertise of a medical professional. If you suspect that you may have suffered a concussion, you should always seek medical help and have a proper examination to determine whether damage from some traumatic brain event has occurred. The developers, its partners, affiliates and Apple or its affiliates accept no liability for any medical misdiagnosis.");
                Spacer();
            }
            .padding(10.0)
        }
        .navigationBarTitle("Disclaimer", displayMode: .inline)
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
                    Text("(STMR) This test is designed to evaluate short-term memory recall skills. The user is presented with a sentence, then must recall simple information from that sentence. In this test, both time and accuracy are judged. If a user answers quickly and correctly, they are likely still able to make decisions. If a user answers slowly but correctly, their fine motor skills may be impaired. If a user answers incorrectly, their memory skills may be impaired. More correct answers and lower answering times equates to a higher score.");
                }
                Group {
                    Text("Gross Motor Skill Test")
                        .font(.title2);
                    Spacer();
                    Text("(GMS) This test is designed to evaluate whether the user still maintains gross motor skills. The user must balance a virtual ball on a target for ten seconds. The longer the user is able to hold the ball in the target zone, the better the score.")
                }
            }
            .padding(10.0)
        }
        .navigationBarTitle("About the tests", displayMode: .inline)
    }
}

struct DeveloperAdd: View {
    // Create variables for developer view
    @State var typeOptions = ["crash", "rest", "active"]
    @State var type: String = ""
    @State var reaction: Int64 = 0
    @State var stmr: Int64 = 0
    @State var gms: Int64 = 0
    @State var year: Int64 = Time_Manager().getYear()
    @State var month: Int64 = Time_Manager().getMonth()
    @State var day: Int64 = Time_Manager().getDay()
    @State var hour: Int64 = Time_Manager().getHour()
    @State var minute: Int64 = Time_Manager().getMinute()
    @State var second: Int64 = Time_Manager().getSecond()
    // Go back when finished
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Spacer();
                // Form Fields
                Text("Add a user")
                    .font(.title);
                Spacer();
                Section {
                    Picker(selection: $typeOptions, label: Text("Select type")) {
                        ForEach(0 ..< typeOptions.count) {
                            Text(self.typeOptions[$0])
                        }
                    }
                }
                
                TextField("Enter reaction score", value: $reaction, formatter: NumberFormatter())
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .disableAutocorrection(true)
                    .keyboardType(.numberPad)
                TextField("Enter STMR score", value: $stmr, formatter: NumberFormatter())
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .disableAutocorrection(true)
                    .keyboardType(.numberPad)
                TextField("Enter GMS score", value: $gms, formatter: NumberFormatter())
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .disableAutocorrection(true)
                    .keyboardType(.numberPad)
                
                // Button to carry out add action
                Button(action: {
                    DB_Manager().AddResult(typeValue: self.type, yearValue: self.year, monthValue: self.month, dayValue: self.day, hourValue: self.hour, minuteValue: self.minute, secondValue: self.second, reactionValue: self.reaction, stmrValue: self.stmr, gmsValue: self.gms)
                    
                    self.mode.wrappedValue.dismiss()
                }, label : {
                    Text("Add")
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 10)
                .padding(.bottom, 10)
            }
            .padding(10.0)
        }
        .navigationBarTitle("Developer Tools", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
