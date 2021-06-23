//
//  ContentView.swift
//  myShifts
//
//  Created by Matteo on 22/06/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Rota()
    @State private var showingShift = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenses.shifts) { shift in
                        NavigationLink(destination: ShiftDetail(shift: shift)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(shift.contractor)
                                    Text(shift.selectedDate)
                                        .font(.caption)
                                        .foregroundColor(Color.gray)
                                    
                                }
                                
                                Spacer()
                                
                                Text("£\(shift.total)")
                            }
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationBarTitle(Text("myShifts"))
                .navigationBarItems(trailing: Button(action: {
                    self.showingShift = true
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                })
                
                Spacer()
                
                Button(action: {
                    // go to the Monthly View
                }) {
                    Text("Monthly View")
                }
                .padding(6)
                .background(Color.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .buttonStyle(PlainButtonStyle())
                .font(.title2)
                .foregroundColor(.white)
            }
            .sheet(isPresented: $showingShift) {
                AddShift(expenses: self.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
            expenses.shifts.remove(atOffsets: offsets)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
