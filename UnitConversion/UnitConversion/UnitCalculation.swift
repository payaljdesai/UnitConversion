//
//  File.swift
//  UnitConversion
//
//  Created by Payal Desai on 9/25/23.
//

import Foundation
import SwiftUI

struct UnitCalculation {
    enum LenthUnits :String, CaseIterable
    {
        case Kilometer = "Kilometer"
        case Metere = "Metere"
        case Millimeter  = "Millimeter"
        case  Centimeter = "Centimeter"
        case Feet = "Feet"
        case Yards = "Yards"
        case Miles = "Miles"
        case Inches = "Inches"
        
        var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    }
    
    func getUnitType(unitValue : LenthUnits) -> Dimension{
        
        switch(unitValue)
        {
        case .Kilometer:
            return UnitLength.kilometers
        case .Metere :
            return UnitLength.meters
        case .Feet :
            return UnitLength.feet
        case .Yards :
            return UnitLength.yards
        case .Miles :
            return UnitLength.miles
        case .Millimeter :
            return UnitLength.millimeters
        case .Centimeter :
            return UnitLength.centimeters
        case .Inches :
            return UnitLength.inches
            
        }
    }
    func convertUnit(firstunit :Dimension , secoundunit2 : Dimension , value : Double) -> Double
    {
        let  firstMeasurement = Measurement(value: value, unit: firstunit)
        let convertedMeasurement = firstMeasurement.converted(to: secoundunit2)
        return convertedMeasurement.value
    }
    
}
