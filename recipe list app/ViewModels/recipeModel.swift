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
        
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String{
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denomoniator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil{
            //Get a single serving size by multiplying denominator by the recipe servings
            denomoniator *= recipeServings
            
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            //Reduce fraction by the greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denomoniator)
            numerator /= divisor
            denomoniator /= divisor
            
            //Get the whole portion if numerator > denominator
            if numerator >= denomoniator{
                
                //Calculated the wholePortions
                wholePortions = numerator / denomoniator
                
                //Calculate the remainder
                numerator = numerator % denomoniator
                
                //Assign to portion string
                portion += String(wholePortions)
            }
            
            //Express the remainder as a fraction
            if numerator > 0 {
                
                //Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " ": ""
                portion += "\(numerator)/\(denomoniator)"
            }
        }
        if var unit = ingredient.unit{
            
            
            
            //if we need to pluralize
            if wholePortions > 1{
                
                //Calculate appropiate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                }else{
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            
            return portion + unit
        }
        
        return portion
    }
    
}
