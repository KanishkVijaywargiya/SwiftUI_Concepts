//
//  ContextMenuBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    @State var backgroundColor: Color = Color.purple
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
        .contextMenu {
            Button(action: {backgroundColor = .green}) {
                Label("Share Post", systemImage: "flame.fill")
            }
            Button(action: {backgroundColor = .red}) {
                Text("Report Post")
            }
            Button(action: {backgroundColor = .orange}) {
                HStack {
                    Text("Like Post")
                    Image(systemName: "heart.fill")
                }
            }
        }
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
