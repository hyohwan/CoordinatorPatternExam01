//
//  FeedCoordinator.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/08.
//

import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    var presenter: UINavigationController
    var childCoordinators: [Coordinator]
    var rootVC: UIViewController?
    
    weak var parentCoordinator: HomeCoordinator?
    
    var viewModel: FeedViewModel
    
    init(presenter: UINavigationController, viewModel: FeedViewModel) {
        self.presenter = presenter
        self.childCoordinators = []
        self.viewModel = viewModel
    }
    
    func start() {
        let vc = DetailViewController()
        rootVC = vc
        vc.coordinator = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)
    }
    
    func pushEditor() {
        let vc = EditorViewController()
        vc.coordinator = self
        vc.viewModel = viewModel
        presenter.pushViewController(vc, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
