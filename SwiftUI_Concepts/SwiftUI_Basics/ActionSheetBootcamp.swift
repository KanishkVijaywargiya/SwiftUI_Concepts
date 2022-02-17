//
//  ActionSheetBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    @State var showActionButton: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isMyPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Circle().frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button(action: {
                    actionSheetOption = .isMyPost
                    showActionButton.toggle()
                }) {
                    Image(systemName: "ellipsis")
                }.accentColor(.primary)
            }
            .padding(.horizontal)
            Rectangle().aspectRatio(1.0, contentMode: .fit)
        }
        .actionSheet(isPresented: $showActionButton, content: getActionSheet)
    }
    
    func getActionSheet() -> ActionSheet {
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            
        }
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            
        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            
        }
        let cancelButton: ActionSheet.Button = .cancel()
        let title = Text("What would you like to do?")
        
        switch actionSheetOption {
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, deleteButton, cancelButton])
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, cancelButton])
        }
//
//        let but1: ActionSheet.Button = .default(Text("Default"))
//        let but2: ActionSheet.Button = .destructive(Text("Destructive"))
//        let but3: ActionSheet.Button = .cancel()
//
//        return ActionSheet (
//            title: Text("This is title!"),
//            message: Text("This is message!"),
//            buttons: [but1, but2, but3]
//        )
    }
}

struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootcamp()
    }
}
