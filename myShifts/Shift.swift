//
//  Shift.swift
//  myShifts
//
//  Created by Matteo on 22/06/2021.
//

import Foundation

struct Shift: Identifiable, Codable {
    var id = UUID()
    let contractor: String
    let hourlyRate: Double
    let hours: Double
    let description: String?
    let extra: Double
    let date: Date
    
    var total: String {
        let total = hourlyRate * hours + extra
        return String(format: "%.2f", total)
    }
}

