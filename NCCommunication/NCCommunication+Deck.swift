// Created for NCCommunication in 2020
// Using Swift 5.0

import Foundation
import Alamofire

extension NCCommunication {
    public func getBoards(customUserAgent: String? = nil, addCustomHeaders: [String: String]? = nil, completionHandler: @escaping (_ account: String, _ boards: [NCCommunicationBoards]?, _ errorCode: Int, _ errorDescription: String) -> Void) {
        
        let account = NCCommunicationCommon.shared.account
        let serverUrlEndpoint = NCCommunicationCommon.shared.url + "/index.php/apps/deck/api/v1.0/boards"
        
        guard let url = NCCommunicationCommon.shared.encodeStringToUrl(serverUrlEndpoint) else {
            completionHandler(account, nil, NSURLErrorBadURL, NSLocalizedString("_invalid_url_", value: "Invalid server url", comment: ""))
            return
        }
        
        let method = HTTPMethod(rawValue: "GET")
        
        var headers = NCCommunicationCommon.shared.getStandardHeaders(addCustomHeaders, customUserAgent: customUserAgent)
        headers.update(.contentType("application/json"))
        
        sessionManager.request(url, method: method, parameters: nil, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200..<300).responseJSON() {
            (response) in
            debugPrint(response)
            
            switch response.result {
            case .failure(let error):
                let error = NCCommunicationError().getError(error: error, httResponse: response.response)
                completionHandler(account, nil, error.errorCode, error.description ?? "")
            case .success( _):
                if let data = response.data {
                    if let jsonResponse = String(data: data, encoding: String.Encoding.utf8) {
                        let decoder = JSONDecoder()
                        let boards = try? decoder.decode([NCCommunicationBoards].self, from: Data(jsonResponse.utf8))
                        completionHandler(account, boards, 0, "")
                        
                    }
                } else {
                    completionHandler(account, nil, NSURLErrorBadServerResponse, NSLocalizedString("_error_decode_xml_", value: "Invalid response, error decode XML", comment: ""))
                }
            }
        }
    }
    
    //    @objc public func putComments(fileId: String, message: String, customUserAgent: String? = nil, addCustomHeaders: [String: String]? = nil, completionHandler: @escaping (_ account: String, _ errorCode: Int, _ errorDescription: String) -> Void) {
    //
    //        let account = NCCommunicationCommon.shared.account
    //        let serverUrlEndpoint = NCCommunicationCommon.shared.url + "/" + NCCommunicationCommon.shared.davRoot + "/comments/files/" + fileId
    //
    //        guard let url = NCCommunicationCommon.shared.encodeStringToUrl(serverUrlEndpoint) else {
    //            completionHandler(account, NSURLErrorBadURL, NSLocalizedString("_invalid_url_", value: "Invalid server url", comment: ""))
    //            return
    //        }
    //
    //        let method = HTTPMethod(rawValue: "POST")
    //
    //        var headers = NCCommunicationCommon.shared.getStandardHeaders(addCustomHeaders, customUserAgent: customUserAgent)
    //        headers.update(.contentType("application/json"))
    //
    //        var urlRequest: URLRequest
    //        do {
    //            try urlRequest = URLRequest(url: url, method: method, headers: headers)
    //            let parameters = "{\"actorType\":\"users\",\"verb\":\"comment\",\"message\":\"" + message + "\"}"
    //            urlRequest.httpBody = parameters.data(using: .utf8)
    //        } catch {
    //            completionHandler(account, error._code, error.localizedDescription)
    //            return
    //        }
    //
    //        sessionManager.request(urlRequest).validate(statusCode: 200..<300).response { (response) in
    //            debugPrint(response)
    //
    //            switch response.result {
    //            case .failure(let error):
    //                let error = NCCommunicationError().getError(error: error, httResponse: response.response)
    //                completionHandler(account, error.errorCode, error.description ?? "")
    //            case .success( _):
    //                completionHandler(account, 0, "")
    //            }
    //        }
    //    }
    //
    //    @objc public func updateComments(fileId: String, messageId: String, message: String, customUserAgent: String? = nil, addCustomHeaders: [String: String]? = nil, completionHandler: @escaping (_ account: String, _ errorCode: Int, _ errorDescription: String) -> Void) {
    //
    //        let account = NCCommunicationCommon.shared.account
    //        let serverUrlEndpoint = NCCommunicationCommon.shared.url + "/" + NCCommunicationCommon.shared.davRoot + "/comments/files/" + fileId + "/" + messageId
    //
    //        guard let url = NCCommunicationCommon.shared.encodeStringToUrl(serverUrlEndpoint) else {
    //            completionHandler(account, NSURLErrorBadURL, NSLocalizedString("_invalid_url_", value: "Invalid server url", comment: ""))
    //            return
    //        }
    //
    //        let method = HTTPMethod(rawValue: "PROPPATCH")
    //
    //        var headers = NCCommunicationCommon.shared.getStandardHeaders(addCustomHeaders, customUserAgent: customUserAgent)
    //        headers.update(.contentType("application/xml"))
    //
    //        var urlRequest: URLRequest
    //        do {
    //            try urlRequest = URLRequest(url: url, method: method, headers: headers)
    //            let parameters = String(format: NCDataFileXML().requestBodyCommentsUpdate, message)
    //            urlRequest.httpBody = parameters.data(using: .utf8)
    //        } catch {
    //            completionHandler(account, error._code, error.localizedDescription)
    //            return
    //        }
    //
    //        sessionManager.request(urlRequest).validate(statusCode: 200..<300).response { (response) in
    //            debugPrint(response)
    //
    //            switch response.result {
    //            case .failure(let error):
    //                let error = NCCommunicationError().getError(error: error, httResponse: response.response)
    //                completionHandler(account, error.errorCode, error.description ?? "")
    //            case .success( _):
    //                completionHandler(account, 0, "")
    //            }
    //        }
    //    }
    //
    //    @objc public func deleteComments(fileId: String, messageId: String, customUserAgent: String? = nil, addCustomHeaders: [String: String]? = nil, completionHandler: @escaping (_ account: String, _ errorCode: Int, _ errorDescription: String) -> Void) {
    //
    //        let account = NCCommunicationCommon.shared.account
    //        let serverUrlEndpoint = NCCommunicationCommon.shared.url + "/" + NCCommunicationCommon.shared.davRoot + "/comments/files/" + fileId + "/" + messageId
    //
    //        guard let url = NCCommunicationCommon.shared.encodeStringToUrl(serverUrlEndpoint) else {
    //            completionHandler(account, NSURLErrorBadURL, NSLocalizedString("_invalid_url_", value: "Invalid server url", comment: ""))
    //            return
    //        }
    //
    //        let method = HTTPMethod(rawValue: "DELETE")
    //
    //        let headers = NCCommunicationCommon.shared.getStandardHeaders(addCustomHeaders, customUserAgent: customUserAgent)
    //
    //        sessionManager.request(url, method: method, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil).validate(statusCode: 200..<300).response { (response) in
    //            debugPrint(response)
    //
    //            switch response.result {
    //            case .failure(let error):
    //                let error = NCCommunicationError().getError(error: error, httResponse: response.response)
    //                completionHandler(account, error.errorCode, error.description ?? "")
    //            case .success( _):
    //                completionHandler(account, 0, "")
    //            }
    //        }
    //    }
    //
    //    @objc public func markAsReadComments(fileId: String, customUserAgent: String? = nil, addCustomHeaders: [String: String]? = nil, completionHandler: @escaping (_ account: String, _ errorCode: Int, _ errorDescription: String) -> Void) {
    //
    //        let account = NCCommunicationCommon.shared.account
    //        let serverUrlEndpoint = NCCommunicationCommon.shared.url + "/" + NCCommunicationCommon.shared.davRoot + "/comments/files/" + fileId
    //
    //        guard let url = NCCommunicationCommon.shared.encodeStringToUrl(serverUrlEndpoint) else {
    //            completionHandler(account, NSURLErrorBadURL, NSLocalizedString("_invalid_url_", value: "Invalid server url", comment: ""))
    //            return
    //        }
    //
    //        let method = HTTPMethod(rawValue: "PROPPATCH")
    //
    //        var headers = NCCommunicationCommon.shared.getStandardHeaders(addCustomHeaders, customUserAgent: customUserAgent)
    //        headers.update(.contentType("application/xml"))
    //
    //        var urlRequest: URLRequest
    //        do {
    //            try urlRequest = URLRequest(url: url, method: method, headers: headers)
    //            let parameters = String(format: NCDataFileXML().requestBodyCommentsMarkAsRead)
    //            urlRequest.httpBody = parameters.data(using: .utf8)
    //        } catch {
    //            completionHandler(account, error._code, error.localizedDescription)
    //            return
    //        }
    //
    //        sessionManager.request(urlRequest).validate(statusCode: 200..<300).response { (response) in
    //            debugPrint(response)
    //
    //            switch response.result {
    //            case .failure(let error):
    //                let error = NCCommunicationError().getError(error: error, httResponse: response.response)
    //                completionHandler(account, error.errorCode, error.description ?? "")
    //            case .success( _):
    //                completionHandler(account, 0, "")
    //            }
    //        }
    //    }
}
