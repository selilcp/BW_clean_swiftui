import XCTest
@testable import B_W

class ProductsListViewModelTests: XCTestCase {
    
    func testProductFetching_success(){
        
        let dummyProduct = Product(id: "1",
                                   name: "product1",
                                   description: "some description",
                                   price: "20",
                                   imagePath: "http://")
        
        let sut = DefaultProductsListViewModel(useCase: dummyGetProductUseCase(products: Products(products: [dummyProduct])),
                                     actions: nil)
        sut.viewDidLoad()
        XCTAssertTrue(sut.products.count == 1)
        XCTAssertEqual(dummyProduct.name, sut.products.first?.name)
    }
}

class dummyGetProductUseCase:GetProductsUseCase{
    
    private let products:Products
    
    init(products: Products){
        self.products = products
    }
    
    func execute(requestValue: B_W.GetProductsUseCaseRequestValue, completion: @escaping (Result<B_W.Products, Error>) -> Void) -> B_W.Cancellable? {
        completion(.success(products))
        return nil
    }
}
