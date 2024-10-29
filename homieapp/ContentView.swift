//
//  ContentView.swift
//  homieapp
//
//  Created by Patima Imanalieva on 28.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showProfileSheet = false 
    
    var body: some View {
        NavigationView {
            VStack {
                imagesBlock()
                    .frame(height: 350)
                
                titleText()
                    .padding(.top, 170)

                Spacer()

                navigationButton()
                    .padding(.top, 35)
                
                myProfile()
                    .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
        .sheet(isPresented: $showProfileSheet) {
            MyProfileView()
        }
    }
}

// Private Extensions

private extension ContentView {
    
    func imagesBlock() -> some View {
        ZStack {
            createImageView(imageName: "image1", width: 264.66, height: 228.85, rotation: -147.04, offsetX: -224, offsetY: -41)
            createImageView(imageName: "image3", width: 216.96, height: 265.3, rotation: 4.55, offsetX: 50, offsetY: 160)
            createImageView(imageName: "image2", width: 216.96, height: 278.79, rotation: 16.29, offsetX: -120, offsetY: 166)
            createImageView(imageName: "image4", width: 265.36, height: 228.85, rotation: -18.24, offsetX: 217, offsetY: 225)
        }
    }
    
    func createImageView(imageName: String, width: CGFloat, height: CGFloat, rotation: Double, offsetX: CGFloat, offsetY: CGFloat) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .cornerRadius(12)
            .rotationEffect(.degrees(rotation))
            .offset(x: offsetX, y: offsetY)
    }
    
    func titleText() -> some View {
        VStack(spacing: -12) {
            Text("homie")
                .font(.system(size: 118, weight: .bold))
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("GradientStart"), Color("GradientEnd")]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .mask(
                    Text("homie")
                        .font(.system(size: 118, weight: .bold))
                )
            
            Text("for ur home")
                .font(.system(size: 23,  weight: .bold))
                .foregroundColor(Color("DarkSubtitle"))
        }
    }
    
    func navigationButton() -> some View {
        NavigationLink(destination: AboutUsView()) { // пишем, что при нажатии переходим в новое окно
            Text("Узнать о нас")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding()
                .frame(width: 200)
                .background(LinearGradient(
                    gradient: Gradient(colors: [Color("GradientStartButton"), Color("GradientEndButton")]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .cornerRadius(20)
        }
    }
        
    func myProfile() -> some View {
        Button(action: {
            showProfileSheet.toggle() // пишем, что при нажатии переходим в модульное окно
        }) {
            Text("Профиль")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color("GradientEndButton"))
                .padding()
                .frame(width: 200)
                .background(.white)
                .cornerRadius(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


