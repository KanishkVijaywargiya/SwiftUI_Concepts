//
//  EscapingViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 06/03/22.
//

import Foundation
import SwiftUI

struct DownloadResult {
    let data: String
}
typealias DownloadCompletion = (DownloadResult) -> ()

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    //    func getData() { // for synchronously calling
    //        let newData = downloadData1()
    //        withAnimation(.spring()) {
    //            text = newData
    //        }
    //    }
    
    func getData() {
        downloadData5 { [weak self] (returnedResult) in
            withAnimation(.spring()) {
                self?.text = returnedResult.data
            }
        }
        // downloadData4 { [weak self] (returnedResult) in
           // withAnimation(.spring()) {
             //   self?.text = returnedResult.data
            // }
        // }
        // downloadData2 { returnedData in
        // text = returnedData
        // }
        // downloadData3 { [weak self] (returnedData) in
           // withAnimation(.spring()) {
             //   self?.text = returnedData
            // }
        // }
        // doSomething(data: <#T##String#>) // using of internal labels
        // doSomething(forData: <#T##String#>) // using of external label
        // doSomething(<#T##data: String##String#>) // using of external label but marked as underscore.
    }
    
    /** synchronous type of func. code running line by line
     func downloadData() -> String { // regular return type. [Synchronous]
     return "New Data!!!"
     }
     **/
    
    // here we are trying to add async code in a logic of synchronous func (ref. AsnycAfter). So we cannot use these regular return types.
    //    func downloadData2() -> String { [Synchronous + Asnychronous code added will not work]
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    //            return "New Data!!!"
    //        }
    //    }
    
    // external & internal labels are added as a paras.
    // func downloadData2(completionHandler: (_ data: String) -> Void) {
    // completionHandler("New Data!!!")
    // }
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New Data!!!")
    }
    
    // & now this makes our code asynchronous.
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New Data!!!")
        }
    }
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data!!!")
            completionHandler(result)
        }
    }
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data!!!")
            completionHandler(result)
        }
    }
    
    /** func with only internal label as a parameter
     func doSomething(data: String) {
     print(data)
     }
     **/
    
    
    /** Func with both external & internal labels as a parameter
     func doSomething(forData data: String) {
     print(data)
     }
     **/
    
    /** Another way of writing both external & internal labels but making exteranl as an underscore
     func doSomething(_ data: String) {
     print(data)
     }
     **/
    
    /** both this func are same with return type void
     func doSomething(_ data: String) -> Void {
     print(data)
     }
     func doSomething(_ data: String) -> () {
     print(data)
     }
     **/
}

// Closure:-  it is basically adding a func as a parameter into the original func.
