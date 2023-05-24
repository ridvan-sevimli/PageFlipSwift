//
//  ContentView.swift
//  PageFlip
//
//  Created by ridvan sevimli on 23.05.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = BookModel()
    @State var searchText = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            TextField("Search", text: $searchText)
                                   .foregroundColor(.primary)
                                   .accentColor(.blue)
                                   .padding(.horizontal, 10)
                           }
                           .padding(.vertical, 10)
                           .background(Color(.systemGray6))
                           .cornerRadius(10)
                           .padding(.horizontal, 10)
        Button(action:{
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
            
        }){
            Text("Search")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
