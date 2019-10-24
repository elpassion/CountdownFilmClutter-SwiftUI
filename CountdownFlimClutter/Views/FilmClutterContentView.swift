import SwiftUI

struct FilmClutterContentView: View {

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.filmBackground
                FilmClutterProgressView()
                SightView()
                Text("7")
                    .foregroundColor(Color.fontColor)
                    .fontWeight(.medium)
                    .font(.system(size: 160))
            }
        }
    }

}
