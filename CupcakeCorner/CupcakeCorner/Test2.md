import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
