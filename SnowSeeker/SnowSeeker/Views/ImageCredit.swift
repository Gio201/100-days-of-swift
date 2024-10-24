//
//  ImageCredit.swift
//  SnowSeeker
//
//  Created by WeMa Mobile on 23/10/2024.
//

import SwiftUI

struct ImageCredit: View {
    let resort: Resort
    
    var body: some View {
        ZStack {
            Text(resort.imageCredit)
                .font(.body)
                .padding(5)
                .foregroundColor(.white)
        }.background(Color.black)
            .opacity(0.5)
            .cornerRadius(12)
            .padding(10)
    }
}

#Preview {
    ImageCredit(resort: .example)
}
