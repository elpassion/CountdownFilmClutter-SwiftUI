import SwiftUI

struct FilmClutterView: View {

    var body: some View {
        HStack(spacing: 0) {
            FilmClutterEdgeView()
                .padding(.leading, 10)
                .padding([.trailing, .top, .bottom], 5)
            FilmClutterContentView()
                .padding(.vertical, 5)
            FilmClutterEdgeView()
                .padding([.trailing], 10)
                .padding([.leading, .top, .bottom], 5)
        }.background(Color.filmEdges)
    }

}
