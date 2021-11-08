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
//        presenter.delegate = self
        presenter.pushViewController(homeVC, animated: false)
        print("HomeCoordinator: \(presenter.viewControllers)")
    }
    
    func pushDetail(viewModel: FeedViewModel) {
        let child = FeedCoordinator(presenter: presenter, viewModel: viewModel)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

// didShow로 처리하면, rx wrapping을 하지 않는 이상, delegation은 하나만 가능하기 때문에
// 하나의 navigationController에 여러개의 childCoordinator가 붙어 있을 경우 가장 상위 한 곳에서 모두 처리해야하는 불편함이 있음
//extension HomeCoordinator: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//        print("HC didShow from \(fromVC)")
//        if navigationController.viewControllers.contains(fromVC) {
//            return
//        }
//        if let rootVC = fromVC as? CoordinatorViewable {
//            print("rootVC as CoordinatorViewable")
//            childDidFinish(rootVC.coord)
//        }
//    }
//}
