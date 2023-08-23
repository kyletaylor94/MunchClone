//
//  Login.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 11/08/2023.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isButtonTapped: Bool = false
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
            ZStack{
                Color.gray
                    .opacity(0.3)
                    .ignoresSafeArea()
                
                LinearGradient(colors: [.green, .cyan], startPoint: .top, endPoint: .bottom)
                    .rotationEffect(Angle(degrees: 75))
                    .blur(radius: 15)
                
                CustomBackGroundAnimation()
                
                VStack(spacing: 20){
                    Spacer()
                    Text("Login")
                        .font(.system(size: 50))
                        .bold()
                    
                    CustomTextField(textfieldtype: "Email", text: $email, isSecureField: false)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    CustomTextField(textfieldtype: "Password", text: $password, isSecureField: true)
                        .textContentType(.password)
                        .disableAutocorrection(true)
                    
                    
                    Button(action: {
                        viewModel.signIn(email: email, password: password)
                    }, label: {
                        Text("Sign in")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    })
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 150, height: 50)
                            .foregroundColor(.orange)
                    )
                    
               
                    Spacer()
                }
            }
        
            Button {
                isButtonTapped.toggle()
            } label: {
                Text("Nincs még fiókod? Regisztrálj!")
                    .font(.title2)
                    .foregroundStyle(.blue)
            }
            .navigationBarBackButtonHidden()
            .fullScreenCover(isPresented: $isButtonTapped, content: {
                Register()
            })
        
    }
}

#Preview {
    Login()
}
