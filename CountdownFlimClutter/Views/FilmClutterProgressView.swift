import SwiftUI

struct FilmClutterProgressView: View {

    @EnvironmentObject var viewModel: FilmClutterViewModel

    var body: some View {
        GeometryReader { geometry in
            FilledCircle()
                .rotation(.init(degrees: -90))
                .trim(from: 0, to: self.viewModel.isAnimating ? 1 : 0)
                .stroke(lineWidth: sqrt(pow(geometry.size.height, 2) + pow(geometry.size.width, 2)))
                .foregroundColor(Color.black)
                .opacity(0.5)
                .clipped()
        }
    }

}
