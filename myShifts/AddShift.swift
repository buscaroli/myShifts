//
//  AddShift.swift
//  myShifts
//
//  Created by Matteo on 23/06/2021.
//

import SwiftUI

struct AddShift: View {
    @State private var contractor: String = ""
    @State private var date: Date = Date()
    @State private var hourlyRate: String = ""
    @State private var hours: String = ""
    @State private var description: String = ""
    @State private var extra: String = ""
    
    @ObservedObject var expenses: Rota
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Shift details")) {
                    TextField("Contractor", text: $contractor)
                    
                    TextField("Rate per hour", text: $hourlyRate)
                    
                    TextField("Shift length (hrs)", text: $hours)
                }
                
                Section(header: Text("Extra claims")) {
                    TextField("Any extra (parking etc.)", text: $description)
                    
                    TextField("Amount of extra: 0.00", text: $extra)
                }
                
                Section(header: Text("Shift date")) {
                    // DatePicker
                }
                
                
            }
            .navigationBarTitle(Text("myShifts"), displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                guard let convertedHourlyRate = Double(self.hourlyRate) else { return }
                guard let convertedHours = Double(self.hours) else { return }
                guard let convertedExtra = Double(self.extra) else { return }
                
                let item = Shift(contractor: self.contractor, hourlyRate: convertedHourlyRate, hours: convertedHours, description: self.description, extra: convertedExtra, date: self.date)
                
                self.expenses.shifts.append(item)
                self.presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}

struct AddShift_Previews: PreviewProvider {
    static var previews: some View {
        AddShift(expenses: Rota())
    }
}
