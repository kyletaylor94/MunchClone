//
//  CustomTextField.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 11/08/2023.
//

import SwiftUI

struct CustomTextField: View {
    var textfieldtype: String = ""
    @Binding var text: String
    @State var isSecureField: Bool
    
    var body: some View {
        if isSecureField{
            SecureField(textfieldtype, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.bar)
                )
        } else {
            TextField(textfieldtype,text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.bar)
                )
        }
    }
}

#Preview {
    CustomTextField(textfieldtype: "email", text: .constant("email"), isSecureField:false)
}
