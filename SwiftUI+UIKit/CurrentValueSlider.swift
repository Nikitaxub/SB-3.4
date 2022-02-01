//
//  CurrentValueSlider.swift
//  SwiftUI+UIKit
//
//  Created by xubuntus on 31.01.2022.
//

import SwiftUI

struct CurrentValueSlider: UIViewRepresentable {
    @Binding var value: Float
    let opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: Double(opacity) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $value)
    }
}

extension CurrentValueSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct CurrentValueSlider_Previews: PreviewProvider {
    static var previews: some View {
        CurrentValueSlider(value: .constant(50), opacity: 50)
    }
}
