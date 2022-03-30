//
//  RecipeTabView.swift
//  recipe list app
//
//  Created by Nico Florschütz on 30.03.22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            
            RecipieFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
