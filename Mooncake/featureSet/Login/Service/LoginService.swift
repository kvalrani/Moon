//
//  SwiftUIView.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//
import Combine
import Firebase
import Foundation

protocol LoginService {
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error>
}

struct LoginCredentials {
    var email: String
    var password: String
}

final class LoginServiceImpl: LoginService {
    
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { _, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(()))
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

