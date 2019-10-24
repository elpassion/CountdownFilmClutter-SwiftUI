import SwiftUI

struct ContentView: View {

    var viewModel = ProgressViewModel.default

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                FilmClutterView()
                    .fixedSize(horizontal: false, vertical: true)
                Button(action: {
                    withAnimation {
                        self.viewModel.animate.toggle()
                    }
                }) {
                    Text("Tap on me")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
