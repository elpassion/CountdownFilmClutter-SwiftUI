import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewModel: FilmClutterViewModel

    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                FilmClutterView()
                HStack {
                    Spacer()
                    Button(action: { self.viewModel.start() }, label: { Text("Start") })
                        .disabled(self.viewModel.animateProgress)
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
        ContentView().environmentObject(FilmClutterViewModel())
    }
}
