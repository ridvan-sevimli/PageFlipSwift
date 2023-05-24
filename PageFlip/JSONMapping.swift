//
//  JSONMapping.swift
//  PageFlip
//
//  Created by ridvan sevimli on 23.05.23.
//

import SwiftUI


struct Docs : Decodable{
    var docs : [BookDetails]
}

struct BookDetails : Decodable, Identifiable{
    var title : String
    var first_publish_year : Int64?
    var number_of_pages_median : Int64?
    var ratings_average : Float64?
    var cover_i : Int?
    var author_key : [String]?
    var author_name : [String]?
    var subject : [String]?
    var id : String {
        get{
            return UUID().uuidString
        }
    }
}

struct EditionKey : Decodable{
    var edition : String
}

