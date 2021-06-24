//
//  GetMomentsByUserIDAPISession.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/23.
//

import Foundation
import Alamofire
import RxSwift

protocol GetMomentsByUserIDAPISessionType {
    func getMoments(userID: String) -> Observable<MomentsDetails>
}

struct GetMomentsByUserIDAPISession: GetMomentsByUserIDAPISessionType {
    private struct Session: APISession {
        typealias ModelType = MomentsDetails

        let path = L10n.Development.graphqlPath
        let parameters: Parameters
        let headers: HTTPHeaders = .init()

        // swiftlint:disable no_hardcoded_strings
        init(userID: String) {
            let variables: [AnyHashable: Encodable] = ["userID": userID]
            parameters = [
                "query": Self.query,
                "variables": variables
            ]
        }
        // swiftlint:enable no_hardcoded_strings

        fileprivate func post() -> Observable<MomentsDetails> {
            return post(path, parameters: parameters, headers: headers)
        }

        // swiftlint:disable no_hardcoded_strings
        private static let query = """
            query getMomentsDetailsByUserID(userID: $userID!) {
                getMomentsDetailsByUserID(userID: $userID
                    userDetails {
                        id
                        name
                        avatar
                        backgroundImage
                    }
                    moments {
                        id
                        userDetails {
                            name
                            avatar
                        }
                        type
                        title
                        photos
                        createdData
                    }
                }
            }
        """
        // swiftlint:enable no_hardcoded_strings
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        let session = Session(userID: userID)
        return session.post()
    }
}