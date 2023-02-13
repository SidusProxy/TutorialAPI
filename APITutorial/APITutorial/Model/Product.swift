//
//  Product.swift
//  APITutorial
//
//  Created by Gianluca Annina on 13/02/23.
//

import Foundation

typealias Products = [ProductElement]

struct ProductElement: Codable, Hashable {
    
    static func == (lhs: ProductElement, rhs: ProductElement) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let images: [String]
    let creationAt, updatedAt: String?
    let category: Category
}

struct Category: Codable {
    let id: Int?
    let name: Name
    let image: String?
    let creationAt, updatedAt: String?
}


enum Name: String, Codable {
    case clothes = "Clothes"
    case electronics = "Electronics"
    case furniture = "Furniture"
    case others = "Others"
    case shoes = "Shoes"
}

