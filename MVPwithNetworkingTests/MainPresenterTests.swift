//
//  MainPresenterTests.swift
//  MVPwithNetworkingTests
//
//  Created by SilentObserver on 16/07/2020.
//  Copyright © 2020 Nathan Furman. All rights reserved.
//

import XCTest
@testable import MVPwithNetworking

class MockView: MainViewProtocol {
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
}

class MockNetworkService: NetworkServiceProtocol {
    
    var comments: [Comment]!
    
    init() {}
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> ()) {
        if let comments = comments {
            completion(.success(comments))
            return
        }
        let error = NSError(domain: "", code: 123, userInfo: nil)
        completion(.failure(error as Error))
    }
}

class MainPresenterTests: XCTestCase {
    
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
        router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        networkService = nil
    }

    func testGetSuccessOnComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Foo", body: "Foo")
        comments.append(comment)
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(comments.count, comments.count)
        
    }

}
