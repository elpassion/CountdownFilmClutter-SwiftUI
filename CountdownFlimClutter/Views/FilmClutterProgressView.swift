import SwiftUI

struct FilmClutterProgressView: View {

    @ObservedObject var viewModel = FilmClutterViewModel.default

    var body: some View {
        GeometryReader { geometry in
            Circle()
                .rotation(.init(degrees: -90))
                .trim(from: 0, to: self.viewModel.animateProgress ? 1 : 0)
                .stroke(lineWidth: sqrt(pow(geometry.size.width, 2) + pow(geometry.size.height, 2)) / 2)
                .opacity(0.5)
                .clipped()
        }
    }

}
