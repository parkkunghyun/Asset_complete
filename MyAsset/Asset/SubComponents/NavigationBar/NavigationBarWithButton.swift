//
//  NavigationBarWithButton.swift
//  MyAsset
//
//  Created by Bo-Young PARK on 2021/08/22.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    // 기존 뷰나 modifier에 사용가능한 녀석
    var title: String = "" //let을 쓰면 안불러와도 된다?? var로 써야 필수인가
    // 받아야하는 변수가 있으면 var로 선언하자!!
    
    func body(content: Content) -> some View {
        // content: Content부분이 modifier가 적용될 뷰를 가져오는 부분
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(
                    action: {
                        print("자산추가버튼 tapped")
                    },
                    label: {
                        Image(systemName: "plus")
                        Text("자산추가")
                            .font(.system(size: 12))
                    }
                )
                .accentColor(.black) //강조하기 위해서 사용!
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                .overlay( //뷰 원본의 공간을 기준으로 그 위에 새로운 뷰를 중첩하여 쌓는 기능
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                    // border는 굉장히 두꺼움 -> 선을 뷰 바깥쪽에서부터 그림!!
                    // stroke는 반은 안 반은 바깥을 그림
                )
            )
            //.navigationTitle("hello") -> 이거에 관련된게 아래 있는내용 -> inline은 중앙 large는 큰데 왼쪽정렬
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { //뷰가 실행될때 특정액션을 실행!! onDisApper은 반대!
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor =
                    UIColor(white: 1, alpha: 0.6)
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}

extension View {
    func navigaionBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: "내 자산"))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigaionBarWithButtonStyle("내 자산")
        }
    }
}
