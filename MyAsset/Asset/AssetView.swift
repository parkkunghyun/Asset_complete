//
//  AssetView.swift
//  MyAsset
//
//  Created by Bo-Young PARK on 2021/08/21.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Spacer()
                    AssetMenuGridView()
                    AssetBannerView()
                        .aspectRatio(5/2, contentMode: .fit)
                    AssetSummaryView()
                        .environmentObject(AssetSummaryData())
                }
            }
            .background(Color.gray.opacity(0.2))
            .navigaionBarWithButtonStyle("내 자산")
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}