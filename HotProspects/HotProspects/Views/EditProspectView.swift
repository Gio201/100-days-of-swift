//
//  EditProspectView.swift
//  HotProspects
//
//  Created by WeMa Mobile on 17/10/2024.
//

import SwiftUI

struct EditProspectView: View {
    @State var prospect: Prospect
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
                .textContentType(.name)
                .font(.title)
            
            TextField("Email address", text: $prospect.emailAddress)
                .textContentType(.emailAddress)
                .font(.title)
        }
    }
}

#Preview {
    EditProspectView(prospect: Prospect(name: "", emailAddress: "", isContacted: false))
}
