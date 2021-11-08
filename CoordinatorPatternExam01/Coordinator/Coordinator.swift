//
//  Coordinator.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var presenter: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    
    func childDidFinish(_ child: Coordinator?) {
        print("childDidFinish \(childCoordinators)")
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                print("childDidFinish remove \(childCoordinators)")
                break
            }
        }
        // 추가 개별 작업이 필요하면 각 XxxCoordinator로 옮겨서 구현할 것
    }
}
