import Foundation

class ProductsListItemViewModel{
    let name: String
    let price: String
    let description: String
    let imagePath: String
    
    init(product: Product) {
        self.name = product.name ?? ""
        self.price = product.price ?? ""
        self.description = product.description ?? ""
        self.imagePath = product.imagePath ?? ""
    }
}
