import SwiftUI

struct HoleInViewMask: View {

    init(holeRect: CGRect, cornerSize: CGSize) {
        self.holeRect = holeRect
        self.cornerSize = cornerSize
    }

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.addRect(.init(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height))
                path.addRoundedRect(in: self.holeRect, cornerSize: self.cornerSize)
            }.fill(style: .init(eoFill: true))
        }
    }

    private let holeRect: CGRect
    private let cornerSize: CGSize

}
