//
//  AppCoordinator.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import Foundation
import UIKit

class AppCoordinator: NSObject, Coordinator {
    var presenter: UINavigationController
    var childCoordinators: [Coordinator]
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = UINavigationController()
        self.childCoordinators = []
    }
    
    func start() {
        window.rootViewController = presenter
        
        presenter.view.backgroundColor = .red
        
        let coordinator = HomeCoordinator(presenter: presenter)
        childCoordinators.append(coordinator)
        coordinator.start()
        
        window.makeKeyAndVisible()
    }
    
    
}
