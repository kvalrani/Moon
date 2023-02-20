//
//  CalendarView.swift
//  Mooncake
//
//  Created by Alex Ruhl on 2/13/23.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Int = 0
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Su").font(.headline)
                Text("Mo").font(.headline)
                Text("Tu").font(.headline)
                Text("We").font(.headline)
                Text("Th").font(.headline)
                Text("Fr").font(.headline)
                Text("Sa").font(.headline)
            }
            .padding(.bottom, 10)
            
            ForEach(1...30, id: \.self) { day in
                HStack {
                    if day % 7 == 1 {
                        Text("\(day)").font(.body).foregroundColor(.red)
                        Spacer()
                    } else {
                        Button(action: {
                            self.selectedDate = day
                        }) {
                            Text("\(day)").font(.body)
                        }
                        Spacer()
                    }
                    
                    if day % 7 == 0 {
                        Spacer().frame(height: 20)
                    }
                }
            }
            
            if self.selectedDate != 0 {
                DropDownView(selectedDate: self.selectedDate)
            }
        }
    }
}

struct DropDownView: View {
    var selectedDate: Int
    var body: some View {
        VStack {
            Text("Selected date: \(selectedDate)")
                .padding()
            Divider()
            Text("Drop down menu content goes here...")
        }
        .background(Color.gray)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

