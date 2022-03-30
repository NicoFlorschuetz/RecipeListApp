//
//  recipe_list_app.swift
//  recipe list app
//
//  Created by Nico Florschütz on 29.03.22.
//

import SwiftUI

@main
struct recipe_list_app: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
        }
    }
}
