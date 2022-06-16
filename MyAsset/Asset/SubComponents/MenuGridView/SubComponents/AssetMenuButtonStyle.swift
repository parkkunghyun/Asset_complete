//
//  AssetMenuButtonStyle.swift
//  MyAsset
//
//  Created by Bo-Young PARK on 2021/08/22.
//

import SwiftUI

struct AssetMenuButtonStyle: ButtonStyle {
    // UIKit은 UIButton이 있고 SwiftUI는 ButtonStyle이있다!!
    let menu: AssetMenu
    
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            Image(systemName: menu.systemImageName) // sfsymbol아이콘을 사용!
                .resizable() //이미지크기를 맞추겠다 선언!
                .frame(width: 30, height: 30)
                .padding([.leading, .trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/) //패딩은 내부를 크게 키워주는거!
            Text(menu.title)
                .font(.system(size: 12, weight: .bold))
        }
        .padding()
        .foregroundColor(.blue)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AssetMenuButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 24) {
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .creditScore))
            
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .bankAccount))
            
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .creditCard))
            
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .cash))
        }
        .background(Color.gray.opacity(0.2))
    }
}
