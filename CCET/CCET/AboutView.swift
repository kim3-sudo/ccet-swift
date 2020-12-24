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
                Text("About this app")
                    .font(.title);
                Spacer();
                Text("After crashing, cyclists are all too eager to hop back on their bike without being evaluated for a concussion, even if there's a possibility that their head might have experienced a traumatic event. For obvious reasons, this behavior is quite dangerous, and in amateur cycling, the dangers are amplified by the very fact that cycling is very much an individual sport - there's no sports medicine staff readily available and trailing behind on every training ride to evaluate concussions like those in the pro peloton get.");
                Spacer();
                Text("This is a preliminary, work-in-progress, fledgling, side-project app as I learn how to use Swift for native iOS (and by proxy, macOS) app development to solve a problem that I haven't found a good solution for. Sure, concussion testing apps exist, but they don't really function well for long-term cognitive tracking, marking distinct events (like crashes), or setting new baselines at different activity levels - adrenaline makes the brain behave differently than when at rest.");
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
