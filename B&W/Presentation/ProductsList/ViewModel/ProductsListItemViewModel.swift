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
        guard let url = URL(string: imagePath) else{ return}
        // Fetch Image Data
        DispatchQueue.global(qos: .background).async { [weak self] in
            let data = try? Data(contentsOf: url)
            self?.image.value = data
        }
    }
}
