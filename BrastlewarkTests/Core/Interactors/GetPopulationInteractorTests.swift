//
//  GetPopulationInteractorTests.swift
//  BrastlewarkTests
//
//  Created by Eduardo García González on 10/01/21.
//

import XCTest
import ObjectMapper
import Mockingjay
import RxBlocking

@testable import Brastlewark

class GetPopulationInteractorTests: XCTestCase {

    func testGetPopulationData() {
        let populationJson: String = TestUtil.loadJson(from: "population")
        
        stub(http(.get, uri: "https://git-rba.hackerrank.com/git/e7183895-602e-409d-8b1f-f3f228c6994b"), jsonData(populationJson.data(using: .utf8)!))
         
        let data: Population? = try? GetPopulationInteractor().execute().toBlocking().first()
        
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.population.count ?? 0, 3)
        XCTAssertNotNil(data?.population.first?.name ?? "", "Tobus Quickwhistle")
    }

}
