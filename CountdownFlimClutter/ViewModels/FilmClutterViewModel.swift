import Combine
import SwiftUI

class FilmClutterViewModel: ObservableObject {

    @Published var isAnimating: Bool = false
    @Published var countdownNumber: Int = FilmClutterViewModel.initialCountdownNumber

    func start() {
        reset()

        let timer: AnyPublisher<Void, Never> = Timer
            .publish(every: time, on: .main, in: .common)
            .autoconnect()
            .map { _ in }
            .catch { _ in Empty() }
            .eraseToAnyPublisher()

        timerCancellable = Publishers.Merge(Just(()), timer)
            .sink { [weak self] in self?.changeValue() }
    }

    func reset() {
        isAnimating = false
        countdownNumber = FilmClutterViewModel.initialCountdownNumber
        timerCancellable?.cancel()
    }

    // MARK: - Private

    private func changeValue() {
        isAnimating = false

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
        isAnimating = true
    }

    private static let initialCountdownNumber = 5

    private let time: Double = 0.8
    private var timerCancellable: AnyCancellable?

}
