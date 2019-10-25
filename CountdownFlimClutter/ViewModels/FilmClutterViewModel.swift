import Combine
import SwiftUI

class FilmClutterViewModel: ObservableObject {

    @Published var animationInProgress: Bool = false
    @Published var countdownNumber: Int = 9

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
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] in self?.changeValue() })
    }

    func reset() {
        animationInProgress = false
        countdownNumber = 9
        timerCancellable?.cancel()
    }

    // MARK: - Private

    private func changeValue() {
        animationInProgress = false

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
        animationInProgress = true
    }

    private let time: Double = 0.8
    private var timerCancellable: AnyCancellable?

}
