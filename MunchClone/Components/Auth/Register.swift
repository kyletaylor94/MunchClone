//
//  Register.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 11/08/2023.
//

import SwiftUI
import Firebase

struct Register: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @Environment(\.presentationMode) var present
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.3).ignoresSafeArea()
            LinearGradient(colors: [.gray, .orange], startPoint: .top, endPoint: .bottom)
                .rotationEffect(Angle(degrees: 75))
                .blur(radius: 10)
            
            CustomBackGroundAnimation()
            VStack(spacing: 20){
                Spacer()
                Text("Registration")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
              
                
                CustomTextField(textfieldtype: "Email", text: $email, isSecureField: false)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                CustomTextField(textfieldtype: "Password", text: $password, isSecureField: true)
                    .disableAutocorrection(true)
                    .textContentType(.password)
                    
                
                CustomTextField(textfieldtype: "Fullname", text: $fullname, isSecureField: false)
                    
                
                
                Button(action: {
                    viewModel.registerUser(email: email, password: password, fullname: fullname)
                    present.wrappedValue.dismiss()
                }, label: {
                    Text("Register")
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
        Button(action: {
            present.wrappedValue.dismiss()
        }, label: {
            Text("Van már fiókod? Jelentkezz be!")
                .font(.title2)
                .foregroundStyle(.blue)
        })
    }
}

#Preview {
    Register()
}
