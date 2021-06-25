//
//  GetMomentsByUserIDSession.swift
//  Moments
//
//  Created by 史傲楠 on 2021/6/23.
//

import Foundation
import Alamofire
import RxSwift

protocol GetMomentsByUserIDSessionType {
    func getMoments(userID: String) -> Observable<MomentsDetails>
}

struct GetMomentsByUserIDSession: GetMomentsByUserIDSessionType {
    private struct Session: APISession {
        typealias ResponseType = Response

        let path = L10n.Development.graphqlPath
        let parameters: Parameters
        let headers: HTTPHeaders = .init()

        // swiftlint:disable no_hardcoded_strings
        init(userID: String, toggleDataStore: TogglesDataStoreType = TogglesDataSotre.shared) {
            let variables: [AnyHashable: Encodable] = ["userID": userID,
                                                       "withLikes": toggleDataStore.isToggleOn(.isLikeButtonForMomentsEnabled)]
            parameters = [
                "query": Self.query,
                "variables": variables
            ]
        }
        // swiftlint:enable no_hardcoded_strings

        struct Response: Codable {
            let data: Data

            struct Data: Codable {
                let getMomentsDetailsByUserID: MomentsDetails
            }
        }

        fileprivate func post() -> Observable<Response> {
            return post(path, parameters: parameters, headers: headers)
        }

        // swiftlint:disable no_hardcoded_strings
        private static let query = """
            query getMomentsDetailsByUserID($userID: ID!, $withLikes: Boolean!) {
                getMomentsDetailsByUserID(userID: $userID) {
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
                        createdDate
                        isLiked @include(if: $withLikes),

                    }
                }
            }
        """
        // swiftlint:enable no_hardcoded_strings
    }

    func getMoments(userID: String) -> Observable<MomentsDetails> {
        let session = Session(userID: userID)
        return session.post().map { $0.data.getMomentsDetailsByUserID }
    }
}
