//
//  ApplePay.swift
//  User AUTH
//
//  Created by Jonathan Thompson on 7/15/24.
//

import SwiftUI

// This struct defines the ApplePay view which conforms to the View protocol
struct ApplePay: View {
    // State properties to manage the payment alert visibility and payment success status
    @State private var showingPaymentAlert = false
    @State private var paymentSuccessful = false
    
    // The body property defines the UI of the view
    var body: some View {
        VStack {
            // Button to initiate the payment process
            Button(action: {
                // Simulate payment process
                paymentSuccessful = Bool.random() // Randomly determine if payment is successful
                showingPaymentAlert = true // Show payment alert
            }) {
                Text("Pay with Apple Pay")
                    .foregroundColor(.white) // Set text color to white
                    .padding() // Add padding around the text
                    .background(Color.black) // Set background color to black
                    .cornerRadius(10) // Make corners rounded with a radius of 10
            }
        }
        // Display an alert based on the showingPaymentAlert state
        .alert(isPresented: $showingPaymentAlert) {
            Alert(
                title: Text(paymentSuccessful ? "Payment Successful" : "Payment Failed"), // Title based on payment success status
                message: Text(paymentSuccessful ? "Your transaction was successful" : "Your transaction could not be completed"), // Message based on payment success status
                dismissButton: .default(Text("OK")) // Dismiss button text
            )
        }
    }
}

// Preview provider for SwiftUI previews
#Preview {
    ApplePay()
}
