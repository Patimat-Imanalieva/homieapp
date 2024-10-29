//
//  MyProfileView.swift
//  homieapp
//
//  Created by Patima Imanalieva on 29.10.2024.
//

import SwiftUI

struct MyProfileView: View {
    // Вводим переменные состояния для каждого поля.
    @State private var name: String = ""
    @State private var nickname: String = ""
    @State private var about: String = ""
    
    init() {
        loadSavedData()  // Загрузка сохраненных данных для всех полей.
    }
    
    var body: some View {
        NavigationView {
            VStack {
                    Image("ProfileIcon")
                        .frame(width:100, height:100)
                        .clipShape(Circle())
                        .padding(.top, 20)
        
                    Form {
                        Section(header: Text("Данные профиля")) {
                            TextField("Имя", text: $name)
                            TextField("Никнейм", text: $nickname)
                            TextField("О себе", text: $about)
                    }
                }
                .frame(maxHeight: .infinity)
                
                HStack(spacing: 15) {
                    Button(action: clearData) {
                        Text("Очистить")
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("CardGray"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(
                                    cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                    Button(action: saveData) {
                        Text("Сохранить")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Профиль")
            .onAppear(perform: loadSavedData) // данные загружаются каждый раз при открытии окна.
            .background(Color("CardGray"))
        }
    }
    
    // Private Func
    
    // Функция 1 - загрузка введенных данных. Обновляем saveData(), чтобы сохранять каждое поле в UserDefaults по отдельному ключу.
    
    private func loadSavedData() {
        name = UserDefaults.standard.string(forKey: "userName") ?? ""
        nickname = UserDefaults.standard.string(forKey: "userNickname") ?? ""
        about = UserDefaults.standard.string(forKey: "userAbout") ?? ""
    }
    
    // Функция 2 - сохраняем введенные данные при следующем сеансе открытия.
    
    private func saveData() {
        UserDefaults.standard.set(name, forKey: "userName")
        UserDefaults.standard.set(nickname, forKey: "userNickname")
        UserDefaults.standard.set(about, forKey: "userAbout")
    }
    
    // Функция 3 - если мы хотим очистить введенные данные (можно сказать сбрасываем их значения).
    
    private func clearData() {
        name = ""
        nickname = ""
        about = ""
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

