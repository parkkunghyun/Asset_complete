//
//  AssetMenuGridView.swift
//  MyAsset
//
//  Created by Bo-Young PARK on 2021/08/22.
//

import SwiftUI



struct AssetMenuGridView: View {
    let menuList: [[AssetMenu]] = [
        [.creditScore, .bankAccount, .investment, .loan],
        [.insurance, .creditCard, .cash, .realEstate]
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            ForEach(menuList, id: \.self) { row in
                // Random Access Colletion만 데이터 받기 가능! -> 배열 등 O(1) 인덱스를 가지는 녀석들만 가능!!
                //문자열은 양방향 접근컬렉션 방식! -> 복잡도 O(N)
                // count 프로퍼티 속도도 마찬가지!!
                // ForEach문에서는 id가 필요!!! -> 그래서 애가 지 안애서 id갖게 해준다
                // 이런 id도 Hashable을 만족해야한다! -> Int, String, Float, Boolean 다 만족함
                // Hashable이란 unique한 키를 말한다!!
                // -> 내가 만든 객체들도 비교 가능하게 만드는 애!
                //Hash 값을 만들더라도 내부 값이 같으면 같은 결과가 나올 것이
                //ForEach는 0..<9 같은 (open)Range<Int>만 가능!
                HStack(spacing: 10) {
                    ForEach(row) { menu in
                        Button("") {
                            print("\(menu.title)버튼 tapped")
                        }
                        .buttonStyle(AssetMenuButtonStyle(menu: menu))
                    }
                }
            }
        }
    }
}
struct AssetMenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        AssetMenuGridView()
    }
}
