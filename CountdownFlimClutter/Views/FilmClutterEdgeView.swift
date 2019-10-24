import SwiftUI

struct FilmClutterEdgeView: View {

    var body: some View {
        VStack(spacing: 10) {
            ForEach(0...6, id: \.self) { _ in
                Color.filmBackground
                    .frame(width: 35, height: 28)
                    .cornerRadius(10)
            }
        }
    }

}
