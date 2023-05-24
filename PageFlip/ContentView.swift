//
//  ContentView.swift
//  PageFlip
//
//  Created by ridvan sevimli on 23.05.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = BookModel()
    
    var body: some View {
        NavigationStack{
            if let firstBook = model.data.first{
                  NavigationLink(destination: DetailView(book: firstBook)){
                        VStack{
                            HStack{
                                Text(firstBook.title).bold()
                            }
                        }
                    }
                }
        }.task{
            await model.loadDataAsync()
        }.refreshable {
            model.loadData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
