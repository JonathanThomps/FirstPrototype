import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background gradient from orange to white
            LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Logo Image at the top
                Image("JTwings")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 100, alignment: .topLeading)
                
                // First navigation card
                VStack {
                    NavigationView {
                        VStack {
                            NavigationLink(destination: ApplePay()) {
                                ImageCard(imageName: "Buff", width: 390, height: 100, text: "Honey Buffalo Wings")
                            }
                        }
                        .frame(width: 400, height: 200) // Set the desired frame size
                        .padding() // Add padding if needed
                    }
                    .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                }
                
                // Second navigation card
                VStack {
                    NavigationView {
                        VStack {
                            NavigationLink(destination: ApplePay()) {
                                ImageCard(imageName: "fried", width: 390, height: 100, text: "Korean Fried Chicken")
                            }
                        }
                        .frame(width: 400, height: 200) // Set the desired frame size
                        .padding() // Add padding if needed
                    }
                    .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                }
                
                // Third navigation card
                VStack {
                    NavigationView {
                        VStack {
                            NavigationLink(destination: ApplePay()) {
                                ImageCard(imageName: "Pepper", width: 390, height: 100, text: "Lemon Pepper Wings")
                            }
                        }
                        .frame(width: 400, height: 200) // Set the desired frame size
                        .padding() // Add padding if needed
                    }
                    .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                }
                
                // Fourth navigation card
                VStack {
                    NavigationView {
                        VStack {
                            NavigationLink(destination: ApplePay()) {
                                ImageCard(imageName: "Gparm", width: 390, height: 100, text: "Garlic Parmesan Wings")
                            }
                        }
                        .frame(width: 400, height: 200) // Set the desired frame size
                        .padding() // Add padding if needed
                    }
                    .frame(width: 420, height: 110) // Set the desired frame size for NavigationView
                }
                
                Spacer()
            }
            
            // "See More" button at the bottom
            NavigationLink {
                ContentViews()
            } label: {
                Text("See More")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(5)
                    .frame(width: 550, height: 5)
                    .padding(.top, 690)
            }
        }
    }
}

// ImageCard view to display an image with text overlay
struct ImageCard: View {
    var imageName: String
    var width: CGFloat
    var height: CGFloat
    var text: String
    
    var body: some View {
        ZStack {
            // Background image
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            
            // Text overlay
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(5)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding([.trailing, .top], 10)
        }
    }
}

#Preview {
    ContentView()
}
