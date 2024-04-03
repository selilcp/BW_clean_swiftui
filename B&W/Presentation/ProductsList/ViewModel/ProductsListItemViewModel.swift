import Foundation

protocol ProductsListItemViewModelInput{
    func fetchImage()
}

protocol ProductsListItemViewModelOutput {
    var name: String { get }
    var description: String { get }
    var price: String { get }
    var image: Observable<Data?> { get }
}

protocol ProductsListItemViewModel: ProductsListItemViewModelInput, ProductsListItemViewModelOutput {}

final class DefaultProductsListItemViewModel: ProductsListItemViewModel {
    let name: String
    let price: String
    let description: String
    private let imagePath: String
    var image: Observable<Data?> = Observable(nil)
    
    init(product: Product) {
        self.name = product.name ?? ""
        self.price = product.price ?? ""
        self.description = product.description ?? ""
        self.imagePath = product.imagePath ?? ""
    }
}

extension DefaultProductsListItemViewModel{
    func fetchImage(){
    }
}
