//
//  ProductCreation.swift
//  APITutorial
//
//  Created by Gianluca Annina on 13/02/23.
//

import Foundation

// MARK: - ProductCreation
struct ProductCreation: Codable {
   
    let title: String
    let price: Int
    let description: String
    let categoryID: Int
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case title, price, description
        case categoryID = "categoryId"
        case images
    }
    
}
