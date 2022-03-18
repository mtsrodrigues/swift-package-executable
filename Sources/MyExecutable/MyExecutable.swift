import Foundation
import FoundationNetworking

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

@main
public struct MyExecutable {
    
    public static func main() async {
        
        let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            print(response.results.count)   
        } catch {
            print(error)
        }

    }
    
}
