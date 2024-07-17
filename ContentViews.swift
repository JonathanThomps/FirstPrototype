//
//  ContentViews.swift
//  User AUTH
//
//  Created by Jonathan Thompson on 7/8/24.
//

import SwiftUI

struct ContentViews: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("JTwings")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 100, alignment: .topLeading)
                VStack {
                    HStack {

                        }
                    }
                VStack {
                      NavigationView {
                          VStack {
                              NavigationLink(destination: ApplePay()) {
                                  ImageCard(imageName: "Honeybbq", width: 390, height: 100, text: "Honey BBQ Wings")
                              }
                          }
                          .frame(width: 400, height: 200) // Set the desired frame size
                          .padding() // Add padding if needed
                      }
                      .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                  }
                        
                VStack {
                      NavigationView {
                          VStack {
                              NavigationLink(destination: ApplePay()) {
                                  ImageCard(imageName: "Hot", width: 390, height: 100, text: "Hot Nashville Wings")
                              }
                          }
                          .frame(width: 400, height: 200) // Set the desired frame size
                          .padding() // Add padding if needed
                      }
                      .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                  }
                        
                VStack {
                      NavigationView {
                          VStack {
                              NavigationLink(destination: ApplePay()) {
                                  ImageCard(imageName: "spicyg", width: 390, height: 100, text: "Spicy Garlic Wings")
                              }
                          }
                          .frame(width: 400, height: 200) // Set the desired frame size
                          .padding() // Add padding if needed
                      }
                      .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                  }
                        
                VStack {
                      NavigationView {
                          VStack {
                              NavigationLink(destination: ApplePay()) {
                                  ImageCard(imageName: "Gparm", width: 390, height: 100, text: "House Special")
                              }
                          }
                          .frame(width: 400, height: 200) // Set the desired frame size
                          .padding() // Add padding if needed
                      }
                      .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                  }
                        
                        Spacer()
                    }
                }
            }
        }
    


#Preview {
    ContentViews()
}
