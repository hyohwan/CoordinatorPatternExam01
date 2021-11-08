//
//  DetailViewController.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    weak var viewModel: DetailViewModel?
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("push", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        setupNavBarAppearance()
    }
    
    private func setupNavigation() {
        guard let nav = navigationController else { return }
        nav.navigationBar.barTintColor = .green
        nav.navigationBar.isTranslucent = false
        nav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        nav.navigationBar.backgroundColor = .gray
    }

    private func setupNavBarAppearance() {

        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.purple
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .yellow
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc
    private func buttonTapped() {
        coordinator?.pushEditor(viewModel: EditorViewModel())
    }
}
