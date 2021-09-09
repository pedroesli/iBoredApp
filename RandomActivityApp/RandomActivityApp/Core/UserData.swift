//
//  UserData.swift
//  RandomActivityApp
//
//  Created by Rafael Basso on 31/08/21.
//

import UIKit

class UserData {
    
    private static var filterPreferences = UserData.getFilters()
    
}

extension UserData {
    
    // Salvar array de booleans.
    
    public static func saveFilters(filter: TypeFilter) {
        UserDefaults.standard.set(filter.getValuesAsBool(), forKey: "FilterArray")
    }
    
    public static func saveFilters() {
        UserDefaults.standard.set(filterPreferences.getValuesAsBool(), forKey: "FilterArray")
    }
    
    // Load array de booleans. Retornar um array de booleans FILTROS
    
    public static func getFilters() -> TypeFilter {
        
        let array = UserDefaults.standard.array(forKey: "FilterArray") as? [Bool] ?? [Bool]()
        
        return TypeFilter(array: array)
    }

    // Muda um valor do array de preferencias
    
    public static func changeFilter(on index: Int, to value: Bool) {
        filterPreferences.changeValue(on: index, to: value)
    }
    
}
