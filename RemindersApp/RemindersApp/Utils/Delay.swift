//
//  Delay.swift
//  RemindersApp
//
//  Created by Róbert Šumšala Jr. on 15/07/2024.
//

import Foundation

class Delay {
    
    private var seconds: Double
    
    init(_ seconds: Double = 4) {
        self.seconds = seconds
    }
    
    var workItem: DispatchWorkItem?
    
    func performWork(_ work: @escaping () -> Void) {
        workItem = DispatchWorkItem(block: {
            work()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: workItem!)
    }
    
    func cancel() {
        workItem?.cancel()
    }
}
