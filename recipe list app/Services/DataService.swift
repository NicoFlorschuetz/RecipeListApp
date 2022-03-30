//
//  DataService.swift
//  recipe list app
//
//  Created by Nico Florschütz on 29.03.22.
//

import Foundation

class DataService{
    
    
    static func getLocalData() -> [Recipe]{
        //Parse local JSON file
        
        
        //Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else{
            return [Recipe]()
        }
        
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            //Create a data object
            let data = try Data(contentsOf: url)
            
            //Decode the data with a json decoder
            let decoder = JSONDecoder()
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Add the uniqe IDs
                for r in recipeData{
                    r.id = UUID()
                    
                    //Add unique IDs to the recipe ingredients 
                    for i in r.ingredients{
                        i.id = UUID()
                    }
                }
                //Return the recipes
                return recipeData
            }
            catch{
                print(error)
            }
            
        }
        catch{
            //Error with getting data
            print(error)
        }
        
        return [Recipe]()
        
    }
    
}
