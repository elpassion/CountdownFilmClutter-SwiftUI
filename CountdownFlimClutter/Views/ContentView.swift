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
                    Spacer()
                    Button(action: { self.viewModel.start() }, label: { Text("Start") })
                    Spacer()
                    Button(action: { self.viewModel.reset() }, label: { Text("Reset") })
                    Spacer()
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
