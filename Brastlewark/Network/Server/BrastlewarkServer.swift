//
//  BrastlewarkServer.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import ObjectMapper

class BrastlewarkServer<T: Mappable> {
    
    let session: Session = Session.default
    
    func loadRequest(_ request: URLRequestConvertible) -> Observable<T> {
        RxAlamofire.request(request)
            .responseJSON()
            .map { response in
                try self.checkForServerError(response: response)
                switch response.result {
                case .success(let data):
                    return try self.parseModel(data)
                case .failure(let error):
                    throw error
                }
            }
    }
    
    private func arrayMap(data: DataResponse<Any, AFError>?) throws -> [T] {
        guard let value = try data?.result.get(),
              let parseModel = Mapper<T>().mapArray(JSONObject: value) else {
            return []
        }
        return parseModel
    }
    
    private func checkForServerError(response: DataResponse<Any, AFError>) throws {
        guard let statusCode = response.response?.statusCode else {
            throw BrastlewarkServerError.parseError
        }
        guard statusCode < 400 else {
            if case let .success(data) = response.result {
                guard let data = data as? [String: Any] else {
                    throw BrastlewarkServerError.parseError
                }
                if let serverError = parseErrorMessage(data) {
                    throw BrastlewarkServerError.serverError(serverError)
                }
            }
            throw BrastlewarkServerError.serverError(nil)
        }
    }
    
    private func parseModel<T: Mappable>(_ json: Any) throws -> T {
        guard let jsonDict = json as? [String: Any] else {
            throw BrastlewarkServerError.parseError
        }
        guard let result = T(JSON: jsonDict) else {
            throw BrastlewarkServerError.parseError
        }
        return result
    }
    
    private func parseErrorMessage(_ json: [String: Any]) -> ServerErrorModel? {
        return ServerErrorModel(JSON: json)
    }
}
