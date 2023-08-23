//
//  PayView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 19/08/2023.
//

import SwiftUI
import PassKit


struct PayView: View {
    @EnvironmentObject var viewModel: CartViewModel
    @Environment(\.presentationMode) var present
    @State private var isPaymentSuccess: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    if viewModel.paymentSuccess{
                       Text("Thanks for your purchase, now you can get your munch. Tap the back button")
                            .font(.title)
                            .bold()
                            .padding()
                        Button(action: {
                            isPaymentSuccess = true
                        }, label: {
                            Text("Back")
                                .foregroundStyle(.white)
                        })
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.orange)
                                .frame(width: 100)
                        )
                        .fullScreenCover(isPresented: $isPaymentSuccess, content: {
                            ContentView()
                        })
                    } else {
                        if viewModel.items.count > 0 {
                            ForEach(viewModel.items, id: \.id){ item in
                                ProductCell(munch: item)
                            }
                            HStack{
                               
                                Text("Your cart total is:")
                                
                                Spacer()
                                
                                Text("\(viewModel.total)Ft")
                                    .bold()
                            }
                            .padding(.horizontal)
                            
                            Button(action: {
                                viewModel.pay()
                            }, label: {
                                Text("Fizetés")
                            })
                            .frame(width: 212, height: 38, alignment: .center)
                            .buttonStyle(ApplePayButtonStyle())
                           
                        }
                    }
                }
            }
            .navigationTitle("My Cart")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        present.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.green)
                    }
                }
            }
            .onDisappear{
                if viewModel.paymentSuccess{
                    viewModel.paymentSuccess = false
                }
            }
        }
    }
}




#Preview {
    PayView().environmentObject(CartViewModel())
}


