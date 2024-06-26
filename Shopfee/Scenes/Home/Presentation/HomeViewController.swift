//
//  HomeViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import UIKit

final class HomeViewController: UIViewController {
    private var notificationBarButton: UIBarButtonItem {
        let image = UIImage(systemName: "bell")?.withTintColor(.brand).withRenderingMode(.alwaysOriginal)

        return UIBarButtonItem(image: image, primaryAction: .init(handler: { [weak self] _ in
            self?.viewModel.notificationButtonTapped()
        }))
    }

    let viewModel: any HomeViewModelProtocol
    init(viewModel: any HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @MainActor
    dynamic required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
}

private extension HomeViewController {
    func configureVC() {
        view = HomeView(viewModel: viewModel)
        navigationItem.rightBarButtonItem = notificationBarButton
    }
}
