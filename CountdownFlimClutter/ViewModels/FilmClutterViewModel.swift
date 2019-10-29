import Combine
import SwiftUI

class FilmClutterViewModel: ObservableObject {

    @Published var isAnimating: Bool = false
    @Published var countdownNumber: Int = FilmClutterViewModel.initialCountdownNumber

    func start() {
        reset()

        let just = Just(())
            .tryMap { _ in }
            .eraseToAnyPublisher()

        let timer = Timer.publish(every: time, on: .main, in: .common)
            .autoconnect()
            .tryMap { _ in }
            .eraseToAnyPublisher()

        timerCancellable = Publishers.Merge(just, timer)
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

private extension Publisher {

    func sink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable {
        self.sink(receiveCompletion: { _ in }, receiveValue: receiveValue)
    }

}
