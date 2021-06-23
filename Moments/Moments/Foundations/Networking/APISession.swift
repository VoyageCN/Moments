//
//  APISession.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/23.
//

import Foundation
import RxSwift

typealias Parameters = [String: Any]
typealias HTTPHeaders = [String: String]

public enum APISessionError: Error {
    case networkError
    case invalidJSON
    case noData
}

protocol APISession {
    associatedtype T: Codable
    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> Observable<T>
}

extension APISession {
    var baseUrl: URL {
        return API.baseURL
    }

    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            let url = baseUrl.appendingPathComponent(path)

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                guard let data = data else {
                    observer.onError(APISessionError.noData)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse, (200...399).contains(httpResponse.statusCode) else {
                    observer.onError(APISessionError.networkError)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(T.self, from: data)
                    observer.onNext(model)
                    observer.onCompleted()
                } catch {
                    observer.onError(APISessionError.invalidJSON)
                }
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
