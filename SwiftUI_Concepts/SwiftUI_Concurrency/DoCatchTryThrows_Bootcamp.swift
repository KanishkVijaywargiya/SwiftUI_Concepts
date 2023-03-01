//
//  DoCatchTryThrows_Bootcamp.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 01/03/23.
//

import SwiftUI

/// - do-catch try throws

class DoCatchTryThrowsBootcampDataManager {
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New Text!", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New Text!")
        } else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }
    
    func getTitle3() throws -> String {
//        if isActive {
//            return "New Text!"
//        } else {
            throw URLError(.badServerResponse)
//        }
    }
    
    func getTitle4() throws -> String {
        if isActive {
            return "Final Text!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}


class DoCatchTryThrowsBootcampViewModel: ObservableObject {
    @Published var text: String = "Starting text."
    let manager = DoCatchTryThrowsBootcampDataManager()
    
    func fetchTitle() {
        //benefit of optional try? is we don't need catch block
//        let newTitle = try? manager.getTitle3()
//        if let newTitle {
//            self.text = newTitle
//        }
        do {
            //let newTitle = try manager.getTitle3()
            //self.text = newTitle
            
            let newTitle = try? manager.getTitle3()
            if let newTitle {
                self.text = newTitle
            }

            let finalTitle = try manager.getTitle4()
            self.text = finalTitle
        } catch {
            self.text = error.localizedDescription
        }
        
        /*
        let result = manager.getTitle2()
        switch result {
        case .success(let newTitle): self.text = newTitle
        case .failure(let error): self.text = error.localizedDescription
        }
        */
        
        /*
        let returnedValue = manager.getTitle()
        if let newTitle = returnedValue.title {
            self.text = newTitle
        } else if let error = returnedValue.error {
            self.text = error.localizedDescription
        }
         */
    }
}

struct DoCatchTryThrows_Bootcamp: View {
    @State private var vm = DoCatchTryThrowsBootcampViewModel()
    @State private var isCheck: Bool = false
    
    var body: some View {
        Text(vm.text)
            .frame(width: 300, height: 300)
            .background(isCheck ? .green : .blue)
            .onTapGesture {
                isCheck.toggle()
                vm.fetchTitle()
            }
    }
}

struct DoCatchTryThrows_Bootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrows_Bootcamp()
    }
}
