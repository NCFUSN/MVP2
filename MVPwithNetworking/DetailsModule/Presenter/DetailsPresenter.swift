//
//  DetailsPresenter.swift
//  MVPwithNetworking
//
//  Created by SilentObserver on 15/07/2020.
//  Copyright © 2020 Nathan Furman. All rights reserved.
//

import Foundation

protocol DetailsViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailsViewPresenterProtocol: class {
    init(view: DetailsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailsPresenter: DetailsViewPresenterProtocol {
    weak var view: DetailsViewProtocol?
    var networkService: NetworkServiceProtocol!
    var comment: Comment?
    var router: RouterProtocol?
    
    required init(view: DetailsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    
    public func setComment() {
        self.view?.setComment(comment: self.comment)
    }
    
    func tap() {
        router?.popToRoot()
    }
}
