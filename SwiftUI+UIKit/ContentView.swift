//
//  ContentView.swift
//  SwiftUI+UIKit
//
//  Created by xubuntus on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float = Float.random(in: 0...100)
    @State private var isChecked: Bool = false
    @State private var targetValue: Int = Int.random(in: 0...100)
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .padding()
            HStack {
                Text("0")
                CurrentValueSlider(value: $currentValue, opacity: computeScore())
                Text("100")
            }
            Button("Проверь меня!", action: { isChecked = true })
                .alert("Your score", isPresented: $isChecked, actions: {}) {
                    Text("\(computeScore())")
                }
                .padding()
            Button("Начать заново", action: changeValue)
        }
        
    }
    
    private func changeValue() {
        targetValue = Int.random(in: 0...100)
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
