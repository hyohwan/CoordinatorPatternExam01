//
//  HomeCoordinator.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import Foundation
import UIKit

class HomeCoordinator: NSObject, Coordinator {
    var presenter: UINavigationController
    var childCoordinators: [Coordinator]
    
    var viewModel: HomeViewModel?
    
    init(presenter: UINavigationController, viewModel: HomeViewModel? = HomeViewModel()) {
        self.presenter = presenter
        self.childCoordinators = []
        self.viewModel = viewModel
    }
    
    func start() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        homeVC.viewModel = viewModel
        presenter.pushViewController(homeVC, animated: false)
        print("HomeCoordinator: \(presenter.viewControllers)")
    }
    
    func pushDetail(viewModel: DetailViewModel) {
        let detailVC = DetailViewController()
        detailVC.coordinator = self
        detailVC.viewModel = viewModel
        presenter.pushViewController(detailVC, animated: true)
    }
    
    func pushEditor(viewModel: EditorViewModel) {
        let editorVC = EditorViewController()
        editorVC.coordinator = self
        editorVC.viewModel = viewModel
        presenter.pushViewController(editorVC, animated: true)
    }
}
