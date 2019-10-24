import Combine
import SwiftUI

class FilmClutterViewModel: ObservableObject {

    static var `default` = FilmClutterViewModel()

    @Published var animateProgress: Bool = false
    @Published var countdownNumber: Int = 9

    func start() {
        changeValue()

        timerCancellable = Timer.publish(every: time, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [weak self] _ in self?.changeValue() })
    }

    func reset() {
        animateProgress = false
        countdownNumber = 9
        timerCancellable?.cancel()
    }

    // MARK: - Private

    private func changeValue() {
        animateProgress = false

        guard countdownNumber > 0 else {
            timerCancellable?.cancel()
            return
        }

        countdownNumber -= 1

        withAnimation(Animation.linear(duration: time)) { [weak self] in
            self?.animateIfNeeded()
        }
    }

    private func animateIfNeeded() {
        guard countdownNumber > 0 else { return }
        animateProgress = true
    }

    private let time: Double = 0.8
    private var timerCancellable: AnyCancellable?

}
