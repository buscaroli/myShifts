//
//  Rota.swift
//  myShifts
//
//  Created by Matteo on 22/06/2021.
//

import Foundation

class Rota: ObservableObject {
    @Published var shifts = [Shift]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(shifts) {
                UserDefaults.standard.set(encoded, forKey: "Shifts")
            }
        }
    }
    
    init() {
        if let shifts = UserDefaults.standard.data(forKey: "Shifts") {
            if let decoded = try? JSONDecoder().decode([Shift].self, from: shifts) {
                self.shifts = decoded
                return
            }
        }
        self.shifts = []
    }
}
