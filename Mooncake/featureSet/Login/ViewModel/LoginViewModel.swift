//
//  SwiftUIView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//

import Combine
import Foundation

protocol LoginViewModel: ObservableObject {
    func login()
    var service: LoginService { get }
    var state: LoginState { get }
    var hasError: Bool { get }
    var credentials: LoginCredentials { get set }
}

enum LoginState {
    case successfullyLoggedIn
    case failed(error: Error)
    case na
}

final class LoginViewModelImpl: LoginViewModel {
    
    let service: LoginService
    @Published var state: LoginState = .na
    @Published var credentials: LoginCredentials = LoginCredentials(email: "", password: "")
    @Published var hasError: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: LoginService) {
        self.service = service
        setupErrorSubscription()
    }
    
    func login() {
        service
            .login(with: credentials)
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .failure(let error):
                        self?.state = .failed(error: error)
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] _ in
                    self?.state = .successfullyLoggedIn
                }
            )
            .store(in: &subscriptions)
    }
}

private extension LoginViewModelImpl {
    
    func setupErrorSubscription() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfullyLoggedIn,
                     .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}

