import SwiftUI

struct FilmClutterContentView: View {

    @EnvironmentObject var viewModel: FilmClutterViewModel

    var body: some View {
        ZStack {
            Color.filmBackground
            FilmClutterProgressView()
            SightShape()
                .stroke(lineWidth: 3)
                .fill(Color.sights)
            Text(String(self.viewModel.countdownNumber))
                .foregroundColor(Color.fontColor)
                .fontWeight(.medium)
                .font(.system(size: 160))
        }
    }

}
