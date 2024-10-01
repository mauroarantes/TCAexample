//
//  TCAexampleTests.swift
//  TCAexampleTests
//
//  Created by Mauro Arantes on 25/09/2024.
//

import XCTest
import ComposableArchitecture
@testable import TCAexample

final class TCAexampleTests: XCTestCase {
    
    func test() async {
        let results = [User].mock
        
        let store = await TestStore(initialState: UserList.State(results: results)) {
            UserList()
        }
        
        await store.send(.usersResponse(Result(.success(results)))) {
            $0.isLoading = false
        }
    }
    
//    func testTapOnLocationFailure() async {
//      let results = GeocodingSearch.mock.results
//
//      let store = await TestStore(initialState: Search.State(results: results)) {
//        Search()
//      } withDependencies: {
//        $0.weatherClient.forecast = { @Sendable _ in
//          struct SomethingWentWrong: Error {}
//          throw SomethingWentWrong()
//        }
//      }
//
//      await store.send(.searchResultTapped(results.first!)) {
//        $0.resultForecastRequestInFlight = results.first!
//      }
//      await store.receive(\.forecastResponse) {
//        $0.resultForecastRequestInFlight = nil
//      }
//    }

}
