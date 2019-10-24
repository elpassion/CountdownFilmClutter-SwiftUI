import SwiftUI

struct FilmClutterProgressView: View {

    @ObservedObject var viewModel = ProgressViewModel.default

    var body: some View {
        return GeometryReader { geometry in
            Circle()
                .rotation(.init(degrees: -90))
                .trim(from: 0, to: self.viewModel.animate ? 1 : 0)
                .stroke(lineWidth: 250)
                .clipped()
        }
    }

}
