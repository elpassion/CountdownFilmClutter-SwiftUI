import SwiftUI

struct ContentView: View {

    var viewModel = FilmClutterViewModel.default

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                FilmClutterView()
                    .fixedSize(horizontal: false, vertical: true)
                HStack {
                    Button(action: { self.viewModel.start() }, label: { Text("Start") })
                    Button(action: { self.viewModel.reset() }, label: { Text("Reset") })
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
