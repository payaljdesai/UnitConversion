//
//  ContentView.swift
//  UnitConversion
//
//  Created by Payal Desai on 9/23/23.
//

import SwiftUI



struct ContentView: View {
    
    
    @State private var fromUnit = UnitCalculation.LenthUnits.Kilometer
    @State private var toUnit = UnitCalculation.LenthUnits.Kilometer
    
    @FocusState private var focusedField: Field?
    private enum Field: Int {
            case yourTextEdit
        }
    var unitCalculation = UnitCalculation()
    
    @State private var fromValue = "0.0"
    var toValue: Double {
        
        let result = unitCalculation.convertUnit(firstunit:  unitCalculation.getUnitType(unitValue: fromUnit), secoundunit2:  unitCalculation.getUnitType(unitValue: toUnit), value: Double(fromValue) ?? 0.0)
        return result
    }
    
        
    var body: some View {
        NavigationView {
            
            Form {
                
                Section {
                    
                    Picker("From Unit", selection: $fromUnit) {
                        ForEach(UnitCalculation.LenthUnits.allCases, id: \.self) { priority in
                            
                            Text(priority.localizedName)
                            
                        }
                    }
                    VStack {
                        
                        TextField("Enter Distance", text: $fromValue)
                            .keyboardType(.decimalPad)
                            .focused($focusedField, equals: .yourTextEdit)
                            .onTapGesture {
                                if (focusedField != nil) {
                                    focusedField = nil
                                }
                            }
                    }
                        
                }
                Section {
                    Picker("To Unit", selection: $toUnit) {
                        ForEach(UnitCalculation.LenthUnits.allCases, id: \.self) { priority in
                            
                            Text(priority.localizedName)
                            
                        }
                        .pickerStyle(.wheel)
                    }
                    
                    Text(String(format: "%.4f", toValue))
                    
                }

            }
            .navigationTitle("Unit Converter")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
