//
//  HomeViewController.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    weak var viewModel: HomeViewModel?
    
    private let buttonA : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("push A", for: .normal)
        button.addTarget(self, action: #selector(buttonATapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonB : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("push B", for: .normal)
        button.addTarget(self, action: #selector(buttonBTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let stack = UIStackView()
    
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
//        guard let nav = navigationController else { return }
//        print("nav: \(nav)")
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .clear
//        navigationController?.view.backgroundColor = .clear
    }
    
    private func setupNavBarAppearance() {
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.configureWithDefaultBackground()
            appearance.configureWithTransparentBackground()
//            navigationController?.navigationBar.backgroundColor = .clear
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .gray
//        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.addArrangedSubview(buttonA)
        stack.addArrangedSubview(buttonB)
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stack.widthAnchor.constraint(equalTo: view.widthAnchor),
//            stack.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    @objc
    private func buttonATapped() {
        coordinator?.pushDetail(viewModel: DetailViewModel(title: "detail A"))
    }
    
    @objc
    private func buttonBTapped() {
        coordinator?.pushDetail(viewModel: DetailViewModel(title: "detail B"))
    }
}
