//
//  CloseButton.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 06/08/23.
//

import SwiftUI

struct CloseButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { dismiss.callAsFunction() }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .font(.title.bold())
                        .symbolRenderingMode(.hierarchical)
                        .frame(width: 30, height: 30)
                        .padding(24)
                }
            }
            Spacer()
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
