import UIKit

class ProductDetailsViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionTextView: UITextView!

    private var viewModel: ProductDetailsViewModel!

    static func create(with viewModel: ProductDetailsViewModel) -> ProductDetailsViewController {
        let view = ProductDetailsViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        title = viewModel.name
        productPriceLabel.text = viewModel.price
        productDescriptionTextView.text = viewModel.description
        if let image = viewModel.image{
            productImageView.image = UIImage(data: image)
        }
    }
}
