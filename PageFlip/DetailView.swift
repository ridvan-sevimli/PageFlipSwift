//
//  DetailView.swift
//  PageFlip
//
//  Created by ridvan sevimli on 23.05.23.
//

import SwiftUI


struct DetailView : View{
    var book : BookDetails
    var body : some View{
        AsyncImage(url: URL(string: "https://covers.openlibrary.org/b/id/\(book.cover_i ?? 0)-M.jpg"))//content closure
        {image in image.resizable()}
    placeholder: {
        ProgressView()}.frame(width: 200, height:300)
        Text(book.title)
        Text("\(book.first_publish_year ?? 0)")
        Text("\(book.number_of_pages_median ?? 0)")
        Text("\(book.ratings_average ?? 0)")
        Text("\(Int(book.cover_i ?? 0))")
        Text(book.author_key![0])
        Text(book.author_name![0])
        Text(book.subject![3])
    }
}
