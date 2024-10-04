//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by WeMa Mobile on 04/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var start = false
    var body: some View {
        ZStack{
            Circle()
                 .frame(width: 100, height: 100)
            
                 .foregroundStyle(AngularGradient(gradient: Gradient(colors: [.red.opacity(0.1),.red.opacity(0.25),.red.opacity(0.5),.red]), center: .center, angle: .degrees( start ? 360 : 0)))
             
                 .mask{
                    Image(systemName: "circle.dotted").resizable()
                    .frame(width: 50, height: 50)
                 }
            
            Image(systemName: "arrow.down").resizable()
                .frame(width: 20, height: 25)
                .symbolEffect(.pulse)
                .foregroundColor(.red)
        }
      
            .onAppear(){
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    start.toggle()
                }
            }
    }
}

#Preview {
    ContentView()
}
