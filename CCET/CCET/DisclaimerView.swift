//
//  DisclaimerView.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text("Disclaimer")
                    .font(.title);
                Spacer();
                Text("This app and its data are not intended to and cannot replace the expertise of a medical professional. If you suspect that you may have suffered a concussion, you should always seek medical help and have a proper examination to determine whether damage from some traumatic brain event has occurred.");
                Spacer();
            }
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
