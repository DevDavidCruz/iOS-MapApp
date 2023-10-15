//
//  Http.swift
//  MapApp
//
//  Created by David Cruz on 10/14/23.
//

import Foundation


class Http {
    
    static public func Get(url : String) async throws -> Data{
        do {
            if let url = URL(string: url){
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let response = try await URLSession.shared.data(for: request)
                return try HttpResponseHandler(response : response)
            }
            else {
                throw HttpError.invalidURL
            }
        }
        catch{
            throw HttpError.invalidURL
        }
    }
    
    static public func Post<T: Encodable>(url: String, body: T?) async throws -> Data {
        do{
            let body_data = try JSONEncoder().encode(body)
            
            if let url = URL(string: url){
                var request = URLRequest(url:url)
                request.httpMethod = "Post"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = body_data
                
                let response = try await URLSession.shared.data(for: request)
                return try HttpResponseHandler(response : response)
            }
            else {
                throw HttpError.invalidURL
            }
        }
        catch{
            print(error.localizedDescription)
            throw HttpError.unexpectedError
        }
    }
    
    private static func HttpResponseHandler(response : (Data, URLResponse)) throws -> Data{
        let http_response = response.1 as! HTTPURLResponse
        switch http_response.statusCode{
        case 201,200:
            return response.0
        case 404:
            throw HttpError.unAuthorized
        case 400:
            throw HttpError.badRequest
        default:
            throw HttpError.unexpectedError
        }
    }
}
