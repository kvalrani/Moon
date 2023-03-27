import Combine
import Foundation
import Firebase
import FirebaseDatabase

enum Gender: String, Identifiable, CaseIterable {
    var id: Self { self }
    case male
    case female
    case other
}

struct RegistrationCredentials {
    
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
    var gender: Gender
}

protocol RegistrationService {
    func register(with registerCredentials: RegistrationCredentials) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService {
    
    func register(with registerCredentials: RegistrationCredentials) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth().createUser(withEmail: registerCredentials.email,
                                       password: registerCredentials.password) { res, error in
                    
                    guard let uid = res?.user.uid, error == nil else {
                        return promise(.failure(error!))
                    }
                    
                    // enum to specify keys to use
                    let values = [
                        UserRegistrationDetails.firstName.rawValue: registerCredentials.firstName,
                        UserRegistrationDetails.lastName.rawValue: registerCredentials.lastName,
                        UserRegistrationDetails.occupation.rawValue: registerCredentials.occupation,
                        UserRegistrationDetails.gender.rawValue: registerCredentials.gender.rawValue
                    ] as [String : Any]
                    
                    let ref = Database.database().reference().child("users").child(uid)
                    
                    ref.updateChildValues(values) { error, _ in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

enum UserRegistrationDetails: String {
    case firstName
    case lastName
    case occupation
    case gender
}
