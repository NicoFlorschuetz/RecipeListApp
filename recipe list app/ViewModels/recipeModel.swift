//
//  recipeModel.swift
//  recipe list app
//
//  Created by Nico Florschütz on 29.03.22.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
        //Create an instance of data service and get the data
        
        self.recipes = DataService.getLocalData()
        
        //Set the recipes property
    }
}
