import SwiftUI

class ProgressViewModel: ObservableObject {

    static var `default`: ProgressViewModel = ProgressViewModel()

    @Published var animate: Bool = false

}
