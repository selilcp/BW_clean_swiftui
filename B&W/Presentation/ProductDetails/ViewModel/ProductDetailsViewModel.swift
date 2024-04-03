import Foundation

protocol ProductDetailsViewModelOutput {
    var name: String { get }
    var image: Data? { get }
    var description: String { get }
    var price: String { get }
}

protocol ProductDetailsViewModel: ProductDetailsViewModelOutput { }

final class DefaultProductDetailsViewModel: ProductDetailsViewModel {

    let name: String
    let description: String
    let price: String
    let image: Data?

    init(product: Product,
         image:Data?) {
        self.name = product.name ?? ""
        self.description = product.description ?? ""
        self.price = product.price ?? ""
        self.image = image
    }
}
