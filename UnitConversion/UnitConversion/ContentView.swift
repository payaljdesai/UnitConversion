//
//  ContentView.swift
//  UnitConversion
//
//  Created by Payal Desai on 9/23/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var fromValue = "0.0"
    @State private var toValue = "0.0"
    
    @State private var fromUnit = LenthUnits.Kilometer
    @State private var toUnit = LenthUnits.Kilometer
    
    @FocusState private var focusedField: Field?
    private enum Field: Int {
            case yourTextEdit
        }
    
    var ConvertedDistanceValue2: Double {
        
        let result = kiloMeter(firstunit:  getUnittype(unitValue: fromUnit), secoundunit2:  getUnittype(unitValue: toUnit), value: Double(fromValue) ?? 0.0)
        return result
    }
        
    var body: some View {
        NavigationView {
            
            Form {
                
                Section {
                    
                    Picker("From Unit", selection: $fromUnit) {
                        ForEach(LenthUnits.allCases, id: \.self) { priority in
                            
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
                        ForEach(LenthUnits.allCases, id: \.self) { priority in
                            
                            Text(priority.localizedName)
                            
                        }
                        .pickerStyle(.wheel)
                    }
                    
                    Text(String(format: "%.4f", ConvertedDistanceValue2))
                    
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
