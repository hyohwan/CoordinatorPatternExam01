//
//  DetailViewController.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import UIKit

//class DetailViewController: UIViewController, CoordinatorViewable {
class DetailViewController: UIViewController {
    
//    var coord: Coordinator? { coordinator }
    weak var coordinator: FeedCoordinator?
    var viewModel: FeedViewModel?
    var willPop: Bool = false {
        didSet {
            guard oldValue != willPop else { return }
            print("DVC willPop \(willPop)")
        }
    }
    
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
//        navigationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        willPop = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let vcs = navigationController?.viewControllers {
            willPop = !vcs.contains(where: { $0 === self })
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if willPop {
            print("DVC didPop")
            coordinator?.didFinish()
        }
    }
    deinit {
        print("DVC deinit")
    }
    
    private func setupNavigation() {
        navigationItem.title = viewModel?.title
        navigationController?.navigationBar.isTranslucent = false
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.yellow
            appearance.titleTextAttributes = [.foregroundColor: UIColor.gray]
            appearance.shadowColor = .clear
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = .yellow
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.gray]
            navigationController?.navigationBar.shadowImage = UIImage()
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
        coordinator?.pushEditor()
    }
}
