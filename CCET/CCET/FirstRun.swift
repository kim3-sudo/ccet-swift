//
//  FirstRun.swift
//  CCET
//
//  Created by Sejin Kim on 12/25/20.
//

import SwiftUI
import Foundation

class FirstRun {
    public func runFirst() {
        let alert = UIAlertController(title: "Disclaimer", message: "This app and its data are not intended to and cannot replace the expertise of a medical professional. If you suspect that you may have suffered a concussion, you should always seek medical help and have a proper examination to determine whether damage from some traumatic brain event has occurred. Your acknowledgement indicates your awareness of the above.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "I agree", style: .default, handler: nil))
        alert.present(alert, animated: true)
        
        UserDefaults.standard.set(true, forKey: "firstRun")
    }
}
