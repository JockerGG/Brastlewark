//
//  TestUtil.swift
//  BrastlewarkTests
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation
import ObjectMapper

class TestUtil {
    class func loadJson(from fileName: String) -> String {
        let bundle: Bundle = Bundle(for: self)
        let path: String = bundle.path(forResource: fileName, ofType: "json")!
        let jsonData: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let jsonString: String = String(data: jsonData, encoding: .utf8)!
        
        return jsonString
    }
}
