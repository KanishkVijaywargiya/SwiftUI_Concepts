//
//  HapticsBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 27/02/22.
//

import SwiftUI

class HapticManager { // haptic singleton class
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Button(action: {
                HapticManager.instance.notification(type: .success)
                HapticManager.instance.impact(style: .heavy)
            }) {
                Text("success - heavy")
            }
            Button(action: {
                HapticManager.instance.notification(type: .warning)
                HapticManager.instance.impact(style: .light)
            }) {
                Text("warning - light")
            }
            Button(action: {
                HapticManager.instance.notification(type: .error)
                HapticManager.instance.impact(style: .medium)
            }) {
                Text("error - medium")
            }
            Divider()
            Button(action: {
                HapticManager.instance.notification(type: .success)
                HapticManager.instance.impact(style: .rigid)
            }) {
                Text("success - rigid")
            }
            Button(action: {
                HapticManager.instance.notification(type: .warning)
                HapticManager.instance.impact(style: .soft)
            }) {
                Text("warning - soft")
            }
        }
        .padding()
    }
}

struct HapticsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticsBootcamp()
    }
}
