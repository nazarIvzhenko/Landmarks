//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Nazar Ivzhenko on 27.01.2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            List {
                modelData.featured[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                .alignmentGuide(.listRowSeparatorLeading, computeValue: { viewDimension in
                    return 15
                })
            }
            .listStyle(.plain)
            .navigationTitle("Featured")
        }
    }
}
    
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
