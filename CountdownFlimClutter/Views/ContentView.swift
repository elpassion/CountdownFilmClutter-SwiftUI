import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewModel: FilmClutterViewModel

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LinearGradient(gradient: self.gradient, startPoint: .bottom, endPoint: .top)
                LinearGradient(gradient: self.gradient, startPoint: .top, endPoint: .bottom)
            }
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Spacer()
                FilmClutterView()
                HStack() {
                    Spacer()
                    Button(action: { self.viewModel.start() }, label: { Text("Start") })
                        .disabled(self.viewModel.animationInProgress)
                        .foregroundColor(self.viewModel.animationInProgress ? Color.gray : Color.white)
                        .padding(.all, 16)
                    Spacer()
                    Button(action: { self.viewModel.reset() }, label: { Text("Reset") })
                        .foregroundColor(Color.white)
                        .padding(.all, 16)
                    Spacer()
                }
            }
        }
    }

    // MARK: - Private

    private var gradient: Gradient {
        Gradient(stops: stops)
    }

    private var stops: [Gradient.Stop] {
        [
            .init(color: .black, location: 0),
            .init(color: .background, location: 1)
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FilmClutterViewModel())
    }
}
