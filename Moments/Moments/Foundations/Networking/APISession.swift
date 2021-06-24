//
//  APISession.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/23.
//

import Foundation
import RxSwift
import Alamofire

public enum APISessionError: Error {
    case networkError(error: Error, statusCode: Int)
    case invalidJSON
    case noData
}

protocol APISession {
    associatedtype ResponseType: Codable

    var defaultHeaders: HTTPHeaders { get }

    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> Observable<ResponseType>
}

extension APISession {
    var baseUrl: URL {
        return API.baseURL
    }

    var defaultHeaders: HTTPHeaders {
        // swiftlint:disable no_hardcoded_strings
        let headers: HTTPHeaders = [
            "x-app-platform": "iOS",
            "x-app-version": UIApplication.appVersion,
            "x-os-version": UIDevice.current.systemVersion
        ]
        // swiftlint:enable no_hardcoded_strings
        return headers
    }

    func post(_ path: String, parameters: Parameters?, headers: HTTPHeaders) -> Observable<ResponseType> {
        return request(path, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
    }
}

private extension APISession {
    func request(_ path: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders) -> Observable<ResponseType> {
        let url = baseUrl.appendingPathComponent(path)
        let allHeaders = HTTPHeaders(defaultHeaders.dictionary.merging(headers.dictionary) { $1 })

        return Observable.create { observer -> Disposable in
            let request = AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: allHeaders, interceptor: nil, requestModifier: nil)
                .validate(statusCode: 200..<300)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            // if no error provided bt Alamofire return .noData error instead.
                            observer.onError(response.error ?? APISessionError.noData)
                            return
                        }
                        do {
                            let model = try JSONDecoder().decode(ResponseType.self, from: data)
                            observer.onNext(model)
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode {
                            observer.onError(APISessionError.networkError(error: error, statusCode: statusCode))
                        } else {
                            observer.onError(error)
                        }
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
