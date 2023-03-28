//
//  SessionService.swift
//  Mooncake
//
//  Created by Pranav Aurora on 2/20/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import Combine
import FirebaseFirestore

enum SessionState {
    case loggedIn
    case loggedOut
}

struct FoodData {
    static var foodData: [String: Any]?
}

struct UserSessionDetails {
    let firstName: String
    let lastName: String
    let occupation: String
    let gender: String
}

protocol SessionService: ObservableObject {
    var state: SessionState { get }
    var userDetails: UserSessionDetails? { get }
    func logout()
}



final class SessionServiceImpl: SessionService {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: UserSessionDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupObservations()
    }
    
    deinit {
        guard let handler = handler else { return }
        Auth.auth().removeStateDidChangeListener(handler)
        print("deinit SessionServiceImpl")
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

private extension SessionServiceImpl {
    
    func setupObservations() {
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] _,_ in
                guard let self = self else { return }
                
                let currentUser = Auth.auth().currentUser
                self.state = currentUser == nil ? .loggedOut : .loggedIn
                
                if let uid = currentUser?.uid {
                    
                    Database
                        .database()
                        .reference()
                        .child("users")
                        .child(uid)
                        .observe(.value) { [weak self] snapshot in
                            
                            guard let self = self,
                                  let value = snapshot.value as? NSDictionary,
                                  let firstName = value[UserRegistrationDetails.firstName.rawValue] as? String,
                                  let lastName = value[UserRegistrationDetails.lastName.rawValue] as? String,
                                  let occupation = value[UserRegistrationDetails.occupation.rawValue] as? String,
                                  let gender = value[UserRegistrationDetails.gender.rawValue] as? String else {
                                return
                            }

                            DispatchQueue.main.async {
                                self.userDetails = UserSessionDetails(firstName: firstName,
                                                                      lastName: lastName,
                                                                      occupation: occupation,
                                                                      gender: gender)
                            }
                        }
                    let db = Firestore.firestore()
                    let docRef = db.collection("food").document(uid)

                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
                            // Extract the data from the document
                            let data = document.data()
                                FoodData.foodData = data
                                print(data)
                        } else {
                            //want to get the default document here...
                            print("Document does not exist")
                        }
                    }
                }
            }

    }
}

