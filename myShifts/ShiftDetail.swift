//
//  ShiftDetail.swift
//  myShifts
//
//  Created by Matteo on 23/06/2021.
//

import SwiftUI

struct ShiftDetail: View {
    let shift: Shift
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Section {
                HStack {
                    Text("Venue: ")
                    Text(shift.contractor)
                }
                .font(.title2)
                
                HStack {
                    Text("Date: ")
                    Text(shift.selectedDate)
                }
            }
            
            
            Section {
                HStack {
                    Text("Hourly rate: £")
                    Text(String(format: "%.2f" , shift.hourlyRate))
                }
                
                HStack {
                    Text("Shift length in hours: ")
                    Text(String(format: "%.2f" , shift.hours))
                }
            }
            
            Section {
                HStack {
                    Text("Extras: \(shift.description ?? "")")
                    Text(String(format: "%.2f" , shift.extra ?? 0.00))
                }
                
                
            }
            
            Section {
                HStack {
                    Text("Total")
                    Text(shift.total)
                }
            }
            .font(.title2)
            
        }
        .padding()
        .background(Color.yellow)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
}

struct ShiftDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShiftDetail(shift: Shift(contractor: "MyChemist London", hourlyRate: 23, hours: 8, description: "Parking", extra: 5.00, date: Date()))
    }
}
