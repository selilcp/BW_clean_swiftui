import UIKit
import SwiftUI

protocol GetProductsFlowCoordinatorDependencies {
    func makeProductsListViewController(actions: ProductsListViewModelActions) -> ProductsListViewController
    func makeProductDetailsViewController(product: Product,
                                          image:Data?) -> ProductDetailsView
}

final class GetProductsFlowCoordinator {

    private weak var tabBarController: UITabBarController?
    private weak var navigationController: UINavigationController?
    private let dependencies: GetProductsFlowCoordinatorDependencies

    private weak var productsListVC: ProductsListViewController?

    init(tabBarController: UITabBarController,
         navigationController: UINavigationController,
         dependencies: GetProductsFlowCoordinatorDependencies) {
        self.tabBarController = tabBarController
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let actions = ProductsListViewModelActions(showProductDetails: showProductDetails)
        let shopVC = dependencies.makeProductsListViewController(actions: actions)

        let navVC = UINavigationController(rootViewController: shopVC)

        tabBarController?.viewControllers = [navVC]
        productsListVC = shopVC
    }

    private func showProductDetails(product: Product,
                                    image: Data?) {
        let detailsView = dependencies.makeProductDetailsViewController(product: product, // create swiftui view intead of view controller
                                                                        image: image)
        let controller = createHostController(view: detailsView)
        productsListVC?.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - SwiftUI view wrapped inside UI hosting contoller
    
    private func createHostController(view: some View) -> UIViewController{
        return UIHostingController(rootView: view)
    }
}
