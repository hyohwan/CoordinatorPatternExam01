//
//  EditorViewController.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import UIKit

class EditorViewController: UIViewController {
    
    weak var coordinator: FeedCoordinator?
    var viewModel: FeedViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    private func setupNavigation() {
        navigationItem.title = (viewModel?.title ?? "") + " > Edit"
        navigationController?.navigationBar.isTranslucent = false
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.red
            appearance.titleTextAttributes = [.foregroundColor: UIColor.yellow]
            appearance.shadowColor = .clear
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = .red
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
            navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .red
    }
}
