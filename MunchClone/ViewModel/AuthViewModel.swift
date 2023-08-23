//
//  AuthViewModel.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 09/08/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseCore

class AuthViewModel: ObservableObject{
    
    var user: User? {
        didSet{
            objectWillChange.send()
        }
    }
    
    func listenToAuthState(){
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
        
        func registerUser(email: String, password: String, fullname: String){
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error{
                    print("DEBUG: CANNOT CREATE USER")
                    return
                }
                
            }
        }
        
        func signIn(email: String, password: String){
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error{
                    print("DEBUG: CANNOT SIGNIN")
                    return
                }
                guard let strongSelf = self else { return }
                
            }
        }
        
        func signOut(){
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print("DEBUG: Error signing out: %@", signOutError)
            }
        }
        
        func deleteUser(){
            let user = Auth.auth().currentUser
            
            user?.delete { error in
                if let error = error {
                    print("DEBUG: CANNOT DELETE THE USER")
                    return
                } else {
                    print("THE USER WAS DELETED")
                }
            }
        }
        
}

