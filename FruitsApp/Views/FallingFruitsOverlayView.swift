//
//  FallingFruitsOverlayView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI

struct FallingFruitsOverlayView: View {
    
    struct Item: Identifiable {
        let id = UUID()
        let offsetX: Double
        let rotationOrientation: Bool
    }
    
    let fruits: [Item]
    let fruitSize: Double
    
    @State private var hasStarted = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                ForEach(fruits) { fruit in
                    FallingFruitView(
                        proxy: proxy,
                        hasStarted: hasStarted,
                        fruitSize: fruitSize,
                        offset: proxy.size.width * fruit.offsetX,
                        rotation: fruit.rotationOrientation
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .onAppear(perform: startAnimation)
    }
    
    func startAnimation() {
        hasStarted = true
    }
}

struct FallingFruitView: View {
    let proxy: GeometryProxy
    let hasStarted: Bool
    let fruitSize: Double
    let offset: Double
    let rotation: Bool
    
    @State private var ballPosition = CGPoint(x: 0, y: -50)
    
    var height: Double {
        proxy.size.height + 100.0
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            RotatingFruit(size: fruitSize, isRotationInverted: rotation)
                .position(ballPosition)
                .offset(x: offset)
                .animation(.gravity(duration: height / (980)).delay(offset / 100).repeatForever(autoreverses: false), value: ballPosition)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onChange(of: hasStarted) { started in
            if started {
                ballPosition = CGPoint(x: 0, y: height)
//                currentOffset = offset
            }
        }
    }
}

struct RotatingFruit: View {
    let size: Double
    let isRotationInverted: Bool
    
    @State private var isRotating = false
    
    var body: some View {
        Image("Apple").resizable()
            .frame(width: size, height: size)
            .rotationEffect(isRotating ? .degrees(isRotationInverted ? 180 : -180) : .zero)
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isRotating)
            .onAppear {
                isRotating = true
            }
    }
}

struct FallingFruitsOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        FallingFruitsOverlayView(
            fruits: [
                .init(offsetX: Double.random(in: 0.1..<0.9), rotationOrientation: Bool.random()),
                .init(offsetX: Double.random(in: 0.1..<0.9), rotationOrientation: Bool.random()),
                .init(offsetX: Double.random(in: 0.1..<0.9), rotationOrientation: Bool.random()),
            ],
            fruitSize: 35
        )
    }
}

extension Animation {
    static func gravity(duration: Double) -> Animation {
        Animation.timingCurve(0.6, 0.0, 1, 1, duration: duration)
        
        
        //Animation.timingCurve(0.0, 0.0, 0.2, 1, duration: duration)
        //Animation.timingCurve(0.2, 0.8, 0.4, 1, duration: duration)
    }
}
