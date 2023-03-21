//
//  ContentView.swift
//  Employee Tip Splitter
//
//  Created by Nathan Meade on 3/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var totalTipAmount: Double = 0
    @State private var fohPercentage: Double = 0.50
    @State private var fohEmployees: Int = 1
    @State private var bohEmployees: Int = 1
    
    var fohTipAmount: Double {
        totalTipAmount * fohPercentage
    }
    
    var bohTipAmount: Double {
        totalTipAmount - fohTipAmount
    }
    
    var fohTipPerEmployee: Double {
        fohTipAmount / Double(fohEmployees)
    }
    
    var bohTipPerEmployee: Double {
        bohTipAmount / Double(bohEmployees)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Tip Information")) {
                    HStack {
                        Text("Total Tip Amount:")
                        Spacer()
                        TextField("Enter total tip amount", value: $totalTipAmount, formatter: NumberFormatter.currency)
                            .keyboardType(.decimalPad)
                    }
                    HStack {
                        Text("FOH Percentage:")
                        Spacer()
                        TextField("Enter FOH percentage", value: $fohPercentage, formatter: NumberFormatter.percent)
                            .keyboardType(.decimalPad)
                    }
                }
                
                Section(header: Text("Employee Information")) {
                    HStack {
                        Text("Number of FOH Employees:")
                        Spacer()
                        Stepper(value: $fohEmployees, in: 1...10) {
                            Text("\(fohEmployees)")
                        }
                    }
                    HStack {
                        Text("Number of BOH Employees:")
                        Spacer()
                        Stepper(value: $bohEmployees, in: 1...10) {
                            Text("\(bohEmployees)")
                        }
                    }
                }
                
                Section(header: Text("Results")) {
                    Text("FOH employees receive \(fohTipPerEmployee, specifier: "%.2f") each")
                    Text("BOH employees receive \(bohTipPerEmployee, specifier: "%.2f") each")
                }
            }
            .navigationBarTitle("Tip Sharing Calculator")
        }
    }
}

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    static var percent: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        //formatter.multiplier = 1000.0 // Divide by 100 to convert percentage to decimal
        return formatter
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
