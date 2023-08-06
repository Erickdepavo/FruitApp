//
//  FruitInfoModalView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI
import YouTubePlayerKit

struct FruitInfoModalView: View {
    
    init(fruit: Fruit, comesFromScan: Bool, initialPage: Int = 0) {
        self.fruit = fruit
        self.comesFromScan = comesFromScan
        self.selectedPage = initialPage
    }
    
    let fruit: Fruit
    let comesFromScan: Bool
    @State private var selectedPage: Int
    
    var body: some View {
        ZStack(alignment: .center) {
            CloseButton()
            VStack(spacing: 32) {
                HStack(spacing: 0) {
                    MascotView(isFact: selectedPage == 2).id(selectedPage == 2)
                    Text(dialogs[selectedPage])
                        .padding(.vertical, 24)
                        .padding(.horizontal, 32)
                        .font(.system(.body, design: .rounded, weight: .semibold))
                        .background(Material.regular, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .animation(.default, value: selectedPage)
                }
                .padding(.top, 32)
                TabView(selection: $selectedPage) {
                    mainPage.tag(0)
                    FruitInfoPageView(fruit: fruit).tag(1)
                    FruitFactsPageView(fruit: fruit).tag(2)
                    experimentPage.tag(3)
                    gamePage.tag(4)
                }
//                .background(Color(uiColor: .quaternarySystemFill))
                .tabViewStyle(.page(indexDisplayMode: .never))
                PageIndicatorView(currentPage: selectedPage, numberOfPages: 5, dotSize: 10)
                    .padding(.bottom, 64)
            }
        }
        .accentColor(fruit.colorValue)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var mainPage: some View {
        VStack {
            Spacer(minLength: 32)
            Text(fruit.name)
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundColor(.accentColor)
                .padding(.bottom, 48)
            Image(fruit.label)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(height: 200)
                .padding(.horizontal, 128)
            Text("This fruit has been added to your collection.")
                .font(.system(.body, design: .rounded, weight: .medium))
                .foregroundColor(.secondary)
                .padding(.top, 48)
                .opacity(comesFromScan ? 1 : 0)
            Spacer(minLength: 64)
        }
    }
    
    var experimentPage: some View {
        VStack {
            Text("Experiment")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundColor(.primary)
            YouTubePlayerView(
                YouTubePlayer(source: .url(fruit.video ?? Fruit.defaultVideo), configuration: .init())
            ) { state in
                switch state {
                case .idle:
                    ProgressView()
                        .controlSize(.large)
                case .ready:
                    EmptyView()
                case .error/*(let error)*/:
                    Text(verbatim: "YouTube player couldn't be loaded")
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .background(Material.regular, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .mask({ RoundedRectangle(cornerRadius: 10, style: .continuous) })
            .padding(.horizontal, 64)
            Spacer()
        }
    }
    
    var gamePage: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .foregroundStyle(Color(uiColor: .tertiarySystemFill))
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
            Image(systemName: "gamecontroller.fill")
                .font(.system(size: 120))
                .foregroundColor(Color(uiColor: .tertiaryLabel))
        }
    }
}

fileprivate let dialogs = [
    "Look at what we have found!",
    "Wanna know how it grows?",
    "Here's some fun facts to you!",
    "I dare you to TRY this at home!",
    "Now, let’s play a fun game!",
]

struct FruitInfoModalView_Previews: PreviewProvider {
    
    static var body: some View {
        Image("Kitchen")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .sheet(isPresented: .constant(true)) {
                FruitInfoModalView(fruit: .orange, comesFromScan: true, initialPage: 3)
            }
            
    }
    
    static var previews: some View {
        body
            .previewInterfaceOrientation(.portrait)
            .previewDisplayName("Portrait")
        body
            .previewInterfaceOrientation(.landscapeRight)
            .previewDisplayName("Landscape")
    }
}

struct MascotView: View {
    let isFact: Bool
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isAnimating = false
    @State private var isMouthOpen = false
    
    var imageName: String {
        if isFact {
            return isMouthOpen ? "FunFactHappy" : "FunFact"
        } else {
            return isMouthOpen ? "NormalHappy" : "Normal"
        }
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 104)
            .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 2)
            .rotationEffect(isAnimating ? .degrees(10) : .degrees(-5))
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .onReceive(timer) { input in
                isMouthOpen.toggle()
            }
            .onAppear(perform: startAnimating)
    }
    
    func startAnimating() {
        isAnimating = true
    }
}

struct PageIndicatorView: View {
    
    let currentPage: Int
    let numberOfPages: Int
    let dotSize: Double
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<numberOfPages, id: \.self) { i in
                Circle()
                    .foregroundColor(.accentColor)
                    .frame(width: dotSize, height: dotSize)
                    .opacity(i == currentPage ? 1 : (1/3))
                    .animation(.easeInOut, value: currentPage)
            }
        }
    }
}
