import SwiftUI

struct FilmClutterEdgeView: View {

    init(edgeSide: EdgeSide) {
        self.edgeSide = edgeSide
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0...50, id: \.self) { _ in
                Color.clear
                    .frame(width: 35, height: 28)
                    .padding(self.edgeSide.biggerEdge, 10)
                    .padding([.top, .bottom], 2.5)
                    .padding(self.edgeSide.smallerEdge, 2.5)
                    .background(Color.black)
                    .mask(HoleInViewMask(holeRect: .init(x: self.edgeSide.holeX, y: 2.5, width: 35, height: 28),
                                         cornerSize: .init(width: 10, height: 10)))
            }
        }
    }

    enum EdgeSide {
        case left
        case right

        var biggerEdge: Edge.Set {
            switch self {
            case .left:
                return .trailing
            case .right:
                return .leading
            }
        }

        var smallerEdge: Edge.Set {
            switch self {
            case .left:
                return .leading
            case .right:
                return .trailing
            }
        }

        var holeX: CGFloat {
            switch self {
            case .left:
                return 5
            case .right:
                return 7.5
            }
        }

    }

    // MARK: - Private

    private let edgeSide: EdgeSide

}
