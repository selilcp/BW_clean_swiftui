import SwiftUI

struct ProductDetailsView: View{
    
    private var viewModel: ProductDetailsViewModel!
    
    static func create(with viewModel: ProductDetailsViewModel) -> ProductDetailsView {
        let view = ProductDetailsView(viewModel: viewModel)
        return view
    }
    
    //MARK: - Prduct details screen design
    
    var body: some View {
        if #available(iOS 14.0, *) {
            VStack(alignment: .leading,spacing: 6) {
                if let imageData = viewModel.image,
                   let uiImage = UIImage(data: imageData){
                    HStack{
                        Spacer()
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame( height: 200.0)
                        Spacer()
                    }
                }
                Text(viewModel.price)
                    .font(.system(size: 24,weight: .light))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(viewModel.description)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            .navigationTitle(viewModel.name)
        }
    }
}
