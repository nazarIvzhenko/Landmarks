//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Nazar Ivzhenko on 27.01.2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var category = ModelData().landmarks[2].category.rawValue
    static var landmarks = Array(ModelData().categories[category]!)

    static var previews: some View {
        CategoryRow(
            categoryName: category,
            items: landmarks
        )
    }
}
