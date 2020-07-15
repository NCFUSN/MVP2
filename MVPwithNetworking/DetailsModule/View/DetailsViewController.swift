//
//  DetailsViewController.swift
//  MVPwithNetworking
//
//  Created by SilentObserver on 15/07/2020.
//  Copyright © 2020 Nathan Furman. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblComment: UILabel!
    var presenter: DetailsViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
    
    // TODO: make swipe
}

extension DetailsViewController: DetailsViewProtocol {
    func setComment(comment: Comment?) {
        lblComment.text = comment?.body
    }
}
