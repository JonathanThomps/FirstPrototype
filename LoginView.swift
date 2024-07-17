import SwiftUI
import Firebase

// This struct defines the LoginView which conforms to the View protocol
struct LoginView: View {
    // State properties to hold the email, password, error message, and login status
    @State private var email = " "
    @State private var password = " "
    @State private var errormessage = " "
    @State private var isLoggedin = false
    
    // The body property defines the UI of the view
    var body: some View {
        NavigationStack{
            VStack{
                // Displaying an image
                Image("JTwings")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 90, alignment: .topLeading)
            }
            // Conditional view rendering based on isLoggedin state
            if isLoggedin {
                SignUpView()
            } else {
                // UI elements for the login form
                Text("Sign In")
                    .font(.title)
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
                
                // Sign-in button that triggers the login function
                Button(action: login){
                    Text("Sign in")
                        .font(.title)
                        .padding()
                    Image(systemName: "arrow.right")
                }
                
                // Displaying the error message if any
                Text(errormessage)
                
                // Navigation links for new account sign-up and continue without account options
                NavigationLink{
                    SignUpView()
                } label: {
                    Text("Don't Have an Account")
                    Text("Sign Up")
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
    
    // Function to handle user login using Firebase Authentication
    func login(){
        Auth.auth().signIn(withEmail: email, password:  password) { authResult, error in
            if let error = error {
                // Update error message if there's an error
                errormessage = error.localizedDescription
            } else {
                // Update isLoggedin state if login is successful
                isLoggedin = true
            }
        }
    }
}

// Preview provider for SwiftUI previews
#Preview {
    LoginView()
}
