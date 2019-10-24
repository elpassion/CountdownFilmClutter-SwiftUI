import SwiftUI

struct SightView: View {

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let centerX = width / 2
                let centerY = height / 2
                let offsetY: CGFloat = height * 0.98
                let smallCircleSize = height * 0.7
                let smallCircleCornerSize = CGSize(width: smallCircleSize, height: smallCircleSize)
                let smallCircleRect = CGRect(x: centerX - smallCircleSize / 2,
                                             y: centerY - smallCircleSize / 2,
                                             width: smallCircleSize,
                                             height: smallCircleSize)

                let bigCircleSize = height * 0.85
                let bigCircleCornerSize = CGSize(width: smallCircleSize, height: smallCircleSize)
                let bigCircleRect = CGRect(x: centerX - bigCircleSize / 2,
                                           y: centerY - bigCircleSize / 2,
                                           width: bigCircleSize,
                                           height: bigCircleSize)

                path.move(to: .init(x: centerX, y: centerY))
                path.addLine(to: .init(x: centerX, y: offsetY))
                path.addLine(to: .init(x: centerX, y: height - offsetY))
                path.move(to: .init(x: centerX, y: centerY))
                path.addLine(to: .init(x: 0, y: centerY))
                path.addLine(to: .init(x: width, y: centerY))

                path.addRoundedRect(in: smallCircleRect, cornerSize: smallCircleCornerSize)
                path.addRoundedRect(in: bigCircleRect, cornerSize: bigCircleCornerSize)
            }
                .stroke(lineWidth: 3)
                .fill(Color.sights)
        }
    }

}
