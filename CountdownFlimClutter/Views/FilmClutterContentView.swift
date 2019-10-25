import SwiftUI

struct FilmClutterContentView: View {

    @EnvironmentObject var viewModel: FilmClutterViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                FilmClutterProgressView()
                SightShape()
                    .stroke(lineWidth: 3)
                    .fill(Color.sights)
                Text(String(self.viewModel.countdownNumber))
                    .foregroundColor(Color.fontColor)
                    .fontWeight(.medium)
                    .font(.system(size: 160))
            }.background(RadialGradient(
                gradient: self.gradient,
                center: .center,
                startRadius: 0,
                endRadius: max(geometry.size.height * 0.75, geometry.size.width * 0.75))
            )
                .padding([.top, .bottom], 2.5)
                .background(Color.black)
        }
    }

    private var gradient: Gradient {
        Gradient(stops: colorStops)
    }

    private var colorStops: [Gradient.Stop] {
        [
            .init(color: .sights, location: 0),
            .init(color: .black, location: 1)
        ]
    }

}
