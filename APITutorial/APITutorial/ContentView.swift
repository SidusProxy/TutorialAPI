//
//  ContentView.swift
//  APITutorial
//
//  Created by Gianluca Annina on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var listOfProduct:Products = []
    var body: some View {
            VStack() {
                VStack{
                    List(content: {
                        ForEach(listOfProduct, id: \.self) { product in
                            Text(product.title ?? "")
                        }})
                }.frame(height: 500)
                Button("test add", action: {
                    Task{
                        do{
                            try await APICaller.shared.createProduct(product: ProductCreation(title: "testProduct", price: 10, description: "kgjyg", categoryID: 1, images: ["https://placeimg.com/640/480/any"]))
                        }catch{
                            print(error)
                        }
                    }
                })
            }.task {
                do{
                    listOfProduct = try await APICaller.shared.fetchProducts()
                }catch{
                    //handle the error
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
