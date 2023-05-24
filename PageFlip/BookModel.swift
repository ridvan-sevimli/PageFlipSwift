//
//  StationboardModel.swift
//  PageFlip
//
//  Created by ridvan sevimli on 23.05.23.
//

import Foundation

class BookModel : ObservableObject{
    @Published var data = [BookDetails]()
    @Published var coverId = "9255566"
    
    func loadData(){
        Task{
            await loadDataAsyncDispatch()
        }
    }
    
    func loadDataAsyncDispatch() async {
        DispatchQueue.global().async {
            do {
                let url = Bundle.main.url(forResource: "searchExample", withExtension: "json")
                let jsonData = try Data (contentsOf: url!)
                let decoder = JSONDecoder ( )
                let data = try decoder.decode(Docs.self, from:jsonData).docs
                self.data = data
            }
            catch {
                fatalError("Error: Unable to load json")
            }
        }
    }
    
    func download() async throws -> Data {
        let url = Bundle.main.url(forResource: "searchExample", withExtension: "json")
        let jsonData = try Data(contentsOf: url!)
        return jsonData
    }
    
    // use the previous method to dowload json
    //from a server
    func loadDataAsync() async{
        do{
            //read the file. Note that you can also use a url alter
            let file = Bundle.main.url(forResource: "searchExample", withExtension: "json")
            //create a data intance
            let jsonData = try Data(contentsOf: file!)
            let decoder = JSONDecoder()
            //and decode it to Person
            let d = try decoder.decode(Docs.self, from: jsonData)
           
            await MainActor.run{
                self.data = d.docs
            }
        }catch{
            fatalError("Couldn't load file from main bundle:\n\(error)")
        }
    }

}
