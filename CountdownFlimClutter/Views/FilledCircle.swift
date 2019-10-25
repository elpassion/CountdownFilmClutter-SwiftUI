import SwiftUI

struct FilledCircle: Shape {

    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = sqrt(pow(width, 2) + pow(height, 2)) / 2

        return Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .init(degrees: 0),
                endAngle: .init(degrees: 360),
                clockwise: false
            )
        }
    }

}
