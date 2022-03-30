//
//  ContentView.swift
//  recipe list app
//
//  Created by Nico Florschütz on 29.03.22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            List(model.recipes){r in
                
                NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                    
                    //MARK: Row Item
                    HStack(spacing: 20.0){
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        
                        Text(r.name)
                    }
                })
                
               
            }
            .navigationTitle(/*@START_MENU_TOKEN@*/"All Recipes"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
