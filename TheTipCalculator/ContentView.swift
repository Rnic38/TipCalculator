//
//  ContentView.swift
//  TheTipCalculator
//
//  Created by Ryan Nicolosi on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    @State var mealCost : Double = 0.00
    @State var tipPercentage : Int = 0
    @State var newTotalWithTip : String = "0.00"
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Please Enter the cost of the meal")
//            TextField("e.g. 00.00",  value: $mealCost, format: .number.precision(.fractionLength(2)))
//                .border(Color.black)
//                .keyboardType(.decimalPad)
//                .multilineTextAlignment(.center)
            TextField("e.g. 00.00",  value: $mealCost, format: .number.precision(.fractionLength(2)))
                .border(Color.black)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)
            Text("Enter tip percentage")
            TextField("e.g. 25%", value: $tipPercentage, format: .number)
                .keyboardType(.numberPad)
                .border(Color.black)
                .multilineTextAlignment(.center)
//            Button("Calculate Percentage"){
//                calculateTipFromPercentage()
//            }
            //Text("Tip value: " + "\(String(describing: newTotalWithTip))")
            //Text("Tip value: " + "\(String(describing: (Double("." + "\(tipPercentage)") ?? 0) * (mealCost)))")
            Text("Tip value: " + calculateTipFromPercentage())
            //Text("Your total value:" + "\(mealCost)" + "\(calculateTipFromPercentage()) " + "=" + "\((Double(calculateTipFromPercentage()) ?? 0.00) + (mealCost))")
            Text("Your total value:" + mealCostPlusTip() + "= " + totalMealCost())
        }
        .padding()
    }
    
    func calculateTipFromPercentage() -> String {
        let tipCost = (Double("." + "\(tipPercentage)") ?? 0) * (mealCost)
        return String(tipCost)
    }
    
    func mealCostPlusTip() -> String {
        return " \(mealCost)" + " + " + "\(calculateTipFromPercentage()) "
    }
    
    func totalMealCost() -> String {
        return String((Double(calculateTipFromPercentage()) ?? 0.00) + (mealCost))
    }
}

extension Formatter {
    static let invisibleZeroValues : NumberFormatter = {
        let formatter  = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.zeroSymbol = ""
        return formatter
    }()
}

