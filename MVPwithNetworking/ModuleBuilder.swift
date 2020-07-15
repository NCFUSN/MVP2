//
//  ModuleBuilder.swift
//  MVPwithNetworking
//
//  Created by SilentObserver on 15/07/2020.
//  Copyright © 2020 Nathan Furman. All rights reserved.
//

import UIKit

protocol AssemblyBuilderProtocol {
    static func instantiateMainModule() -> UIViewController
    static func instantiateDetailsModule(comment: Comment?) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    static func instantiateMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func instantiateDetailsModule(comment: Comment?) -> UIViewController {
        let view = DetailsViewController()
        let networkService = NetworkService()
        let presenter = DetailsPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
