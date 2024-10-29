//
//  AboutUsView.swift
//  homieapp
//
//  Created by Patima Imanalieva on 28.10.2024.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 60) {
                
                titleText()
                
                headerSection
                
                aboutSection
                
                problemSection
                
                solutionSection
                
                socialSection
                
                footerSection
                
            }
            
        }
        .frame(width: 393)
    }
}

// Private Extension

private extension AboutUsView {
    
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
                .font(.system(size: 23, weight: .bold))
                .foregroundColor(Color("DarkSubtitle"))
        }
        .padding(.top, 40)
    }
    
    var headerSection: some View {
        ZStack {
            HStack(spacing: -140) {
                Image("Card2")
                Image("Card1")
            }
            .padding(.bottom, 250)
            .zIndex(0)

            Spacer()

            VStack {
                headerBackground
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    var headerBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color("GradientCard1Start"), Color("GradientCard1End")]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .frame(height: 430)
            .padding(25)
            .zIndex(1)
            .padding(.bottom, -23)
    }
    
    var aboutSection: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color("GradientFooterEnd"), Color("GradientFooterStart")]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .frame(height: 330)
            .overlay(
                Text("homie — медиа-сервис \nс готовыми интерьерными подборками. Он дает возможность делиться подборками предметов интерьера, прикрепляя \nссылки на товары, тем самым \nпомогая сделать поиск товаров простым и понятным.")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(25)
                    .frame(maxWidth: .infinity),
                alignment: .bottomLeading
            )
            .padding(25)
            .zIndex(1)
    }
    
    var problemSection: some View {
        VStack {
            Text("Проблемы")
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 35)
                .foregroundColor(Color("BodyText"))

            VStack(spacing: 35) {
                problemCard(number: "01", text: "Сложность в создании\nи обмене подборками\nинтерьеров", gradientColors: [Color("Numb01GradientStart"), Color("NumbsGradientEnd")])
                
                problemCard(number: "02", text: "Недостаток готовых\nрешений для оформления\nинтерьеров комнат", gradientColors: [Color("Numb02GradientStart"), Color("NumbsGradientEnd")])
                
                problemCard(number: "03", text: "Трудности с поиском,\nа также покупкой \nпонравившихся предметов", gradientColors: [Color("Numb03GradientStart"), Color("NumbsGradientEnd")])
            }
        }
    }
    
    func problemCard(number: String, text: String, gradientColors: [Color]) -> some View {
        ZStack(alignment: .topLeading) {
            Text(number)
                .font(.system(size: 246, weight: .bold))
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .mask(
                    Text(number)
                        .font(.system(size: 246, weight: .bold))
                )
                .offset(x: -105, y: 120)

            Text(text)
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color("BodyText"))
                .multilineTextAlignment(.center)
                .padding(.top, 35)
                .padding(.horizontal, 45)
        }
        .frame(width: 353, height: 353)
        .background(Color("CardGray"))
        .cornerRadius(20)
        .clipped()
    }
    
    var solutionSection: some View {
        ZStack {
            HStack {
                Image("Card3")
            }
            .padding(.bottom, 400)
            .zIndex(0)

            Spacer()

            VStack {
                solutionBackground
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
    
    var solutionBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color("GradientCard2Start"), Color("GradientCard2End")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(height: 400)
            .overlay(
                VStack {
                    Text("Решение")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 45)
                        .padding(.horizontal, 25)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Text("Платформа, на которой \nлюди будут легко находить \nидеи для интерьеров.\nПользователи могут загружать фото интерьеров, которые \nим понравились, а также \nдобавлять ссылки на товары, \nиспользованные в интерьерах.")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(25)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .padding(25)
            .zIndex(1)
    }
    
    var socialSection: some View {
        VStack{
            Text("Cоц-сети")
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 35)
                .foregroundColor(Color("BodyText"))
            
            Text("Подпишитесь на соц-сети \nhomie, чтобы всегда быть \nв курсе наших обновлений!")
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(Color("BodyText"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 45)
            
            VStack(spacing: 20) {
                Image("dzen")
                Image("vk")
            }
        }
        .frame(width: 353, height: 595)
        .background(Color("CardGray"))
        .cornerRadius(20)
        .padding(.top, -25)
    }
    
    var footerSection: some View {
        VStack(spacing: 20) {
            Text("2024/2025")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(Color.white)
            
            Text("homie")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        }
        .frame(width: 353, height: 176)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("GradientFooterEnd"), Color("GradientFooterStart")]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(20)
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
