import Foundation

enum DogAPI_Errors: Error{
    case unableToConvertURL
    case INVALID_URL
    case nilData
    case CannotParseJSONData
}
enum DogApI_Response{
    case success(Any)
    case failure(Error)
    
}
class DogAPI_Helper {
    static let urlString = "https://dog.ceo/api/breeds/list/all"
  
    static func fetchDogData() async throws -> DogBreed {
        
        guard
            let url = URL(string: urlString)
        else{ throw DogAPI_Errors.unableToConvertURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        let results = try decoder.decode(DogBreed.self, from:data)
        
        return results
    }
 
}








//
//func fetchDogData(completion: @escaping (String) -> Void) {
//
//  let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let error = error {
//      print("Error fetching dog name: \(error.localizedDescription)")
//      return
//    }
//
//    if let data = data {
//      let decoder = JSONDecoder()
//        //var randomDog: String
//        let dogList = try? decoder.decode(DogBreed.self, from: data)
//        for dog in 0..<dogList!.message.keys.count{
//            var dogName = Array(dogList!.message.keys)[dog]
//
//            //      let randomIndex = Int.random(in: 0..<dogList!.message.keys.count)
//
//            completion(dogName)
//        }
//    }
//  }
//  task.resume()
//}


//DogAPI_Helper.shared.fetchDogData { (dogName) in
//    self.allDog = dogName
