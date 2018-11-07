import Foundation
import Alamofire

public enum PokedexRooter: URLRequestConvertible {
    static let baseURLPath = "http://pokedex-mti.twitchytv.live"
    case list
    case image(String)
    
    var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        case .image:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "/species"
        case .image(let imageId):
            return "/images/\(imageId)" + ".png"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let parameters: [String: Any] = {
            switch self {
            default:
                return [:]
            }
        }()
        
        let url = try PokedexRooter.baseURLPath.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
