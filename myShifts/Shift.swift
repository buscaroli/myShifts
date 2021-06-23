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
    let extra: Double?
    let date: Date
    
    var total: String {
        let total = hourlyRate * hours + (extra ?? 0.00)
        return String(format: "%.2f", total)
    }
    
    var selectedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE dd/MM/YY"
        
        return dateFormatter.string(from: date)
    }
}

