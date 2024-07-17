//
//  SignUpView.swift
//  User AUTH
//
//  Created by Jonathan Thompson on 6/17/24.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var email = " "
    @State private var password = " "
    @State private var errormessage = " "
    @State private var signUpSuccessfull = false
    @State private var isPulsing = false
    var body: some View {
        NavigationStack{
            
            VStack{
                Image(systemName: "frying.pan.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .scaleEffect(isPulsing ? 1.2 : 1.0)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .repeatForever(autoreverses: true)
                    )
                    .onAppear {
                        self.isPulsing = true
                    }
            }
            if signUpSuccessfull {
                LoginView()
            } else {
                Text("Sign Up")
                    .font(.title )
                    .padding()
                Text("Email Address")
                TextField("Email Address", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                Text("Password")
                SecureField("**********", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                Button(action: signUp){
                    Text("Sign Up")
                        .font(.title)
                        .padding()
                    Image(systemName: "arrow.right")
                }
                
                Text(errormessage)
                
                NavigationLink{
                    LoginView()
                } label: {
                    Text("Already Have an Account")
                    Text("Sign In")
                }
                    
                    NavigationLink{
                        ContentView()
                    } label: {
                        Text("Continue anyways without account")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.gray.opacity(0.25))
                            .cornerRadius(5)
                            .frame(width: 550, height: 10)
                            .padding(.top, 30)
                        
                    }
                }
            }
        }
        func signUp(){
            Auth.auth().createUser(withEmail: email, password:  password) {authResult, error in
                if let error  = error {
                    errormessage = error.localizedDescription
                } else {
                    signUpSuccessfull = true
                    if let user = authResult?.user{
                        let db = Firestore.firestore()
                        db.collection("users").document(user.uid).setData(["email":user.email ?? " ", "uid": user.uid]) { error in
                            if let error = error {
                                errormessage = "Error Saving user"
                            } else {
                                errormessage = "User Signed Up Succesfully"
                                
                            }
                            
                        }
                    }
                }
            }
            
            
            #Preview {
                SignUpView()
            }
        }
    }
    

