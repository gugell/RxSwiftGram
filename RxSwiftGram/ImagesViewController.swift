//
//  ImagesViewController.swift
//  RxSwiftGram
//
//  Created by Eric Huang on 1/23/16.
//  Copyright © 2016 Eric Huang. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Moya

class ImagesViewController: UITableViewController {
    
    let provider = RxMoyaProvider<InstagramAPI>(requestClosure: requestClosure)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("images")
        
        provider.request(.UserFeed)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .subscribeNext{print($0)}

    }
}

extension ImagesViewController {

}