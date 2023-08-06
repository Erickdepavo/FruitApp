//
//  TitleView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI

struct TitleView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var didTapStart = false
    
    var body: some View {
        VStack {
            Text("FruitHunters")
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            Spacer()
            Group {
                if colorScheme == .dark {
                    Button(action: didTap) {
                        Text("Start")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                    }
                    .buttonStyle(.bordered)
                } else {
                    Button(action: didTap) {
                        Text("Start")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(.red)
                .font(.system(.largeTitle, design: .rounded, weight: .semibold))
        }
        .padding(.horizontal, 64)
        .padding(.vertical, 128)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            FallingFruitsOverlayView(
                fruits: [
                    .init(offsetX: 0.1, rotationOrientation: true),
                    .init(offsetX: 0.45, rotationOrientation: true),
                    .init(offsetX: 0.66, rotationOrientation: true),
                ],
                fruitSize: 70
            )
        }
        .background {
            Image("Trees")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(colorScheme == .dark ? 0.5 : 1)
                .background(Color("Sky"))
        }
        .navigationDestination(isPresented: $didTapStart) {
            ContentView()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    func didTap() {
        didTapStart = true
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
            .environment(\.colorScheme, .light)
            .previewDisplayName("Light")
        TitleView()
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark")
    }
}
