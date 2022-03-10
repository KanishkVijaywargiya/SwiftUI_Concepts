//
//  SubscriberViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 09/03/22.
//

import Foundation
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    @Published var showButton: Bool = false
    
    //var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setupTimmer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self = self else { return }
                if isValid && count > 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                text.count > 3 ? true : false
            }
        //.assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                guard let self = self else { return }
                self.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setupTimmer() {
        //timer = Timer
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
                //if self.count >= 10 {
                //self.timer?.cancel()
                //  for item in self.cancellables { item.cancel() }
                //}
            }
            .store(in: &cancellables)
    }
}
