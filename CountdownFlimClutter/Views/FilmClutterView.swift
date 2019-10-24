import SwiftUI

struct FilmClutterView: View {

    var body: some View {
        ZStack {
            FilmClutterContentView()
            HStack {
                FilmClutterEdgeView(edgeSide: .left)
                Spacer()
                FilmClutterEdgeView(edgeSide: .right)
            }
        }
    }

}
