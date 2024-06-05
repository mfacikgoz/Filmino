//
//  PreferencesManager.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation

class PreferencesManager {
    
    var userGenres: [Genre] = []
    
    static let shared: PreferencesManager = PreferencesManager()
    
    private init() { }
}

