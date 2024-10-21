//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by WeMa Mobile on 21/10/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
                        let opacity = Double(min(max((minY - 200) / 100, 0), 1))
                        let scale = max(minY / fullView.size.height, 0.5)
                        let hue = minY / fullView.size.height
                        let dynamicColor = Color(hue: hue, saturation: 0.4, brightness: 1)

                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(dynamicColor)
                            .rotation3DEffect(.degrees(minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(opacity)
                            .scaleEffect(scale)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
