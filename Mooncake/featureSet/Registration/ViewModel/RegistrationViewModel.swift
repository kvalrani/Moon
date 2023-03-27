import Foundation
import Combine

enum RegistrationState {
    case success
    case failure(error: Error)
    case none
}

protocol RegistrationViewModel {
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var hasError: Bool { get }
    var newUser: RegistrationCredentials { get }
    func createUser()
    init(service: RegistrationService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    let service: RegistrationService
    @Published var state: RegistrationState = .none
    @Published var newUser = RegistrationCredentials(email: "",
                                                     password: "",
                                                     firstName: "",
                                                     lastName: "",
                                                     occupation: "",
                                                     gender: .male)
    @Published var hasError: Bool = false

    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscription()
    }
    
    func createUser() {
        service
            .register(with: newUser)
            .sink { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.state = .failure(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .success
            }
            .store(in: &subscriptions)
    }
}

private extension RegistrationViewModelImpl {
    
    func setupErrorSubscription() {
        $state
            .map { state -> Bool in
                switch state {
                case .success, .none:
                    return false
                case .failure:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
