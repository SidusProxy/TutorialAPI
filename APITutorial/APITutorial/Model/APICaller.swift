//
//  APICaller.swift
//  APITutorial
//
//  Created by Gianluca Annina on 13/02/23.
//

import Foundation

class APICaller{
    
    static let shared = APICaller()
    
    
    func fetchProducts() async throws -> Products {
        
        let url = URL(string: "https://api.escuelajs.co/api/v1/products".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        
        let request = URLRequest(url: url!)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let fetchedData = try JSONDecoder().decode(Products.self, from: try mapResponse(response: (data,response)))
        
        return fetchedData
    }
    
    
    
    func createProduct(product:ProductCreation) async throws{
        
        let url = URL(string: "https://api.escuelajs.co/api/v1/products/".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let encoded = try JSONEncoder().encode(product)
        
        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
        
        try mapResponse(response: (data,response))
        
    }
}
