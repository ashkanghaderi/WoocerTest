import Foundation
import NVActivityIndicatorView
import UIKit

class Utility {
    
    static func startIndicatorAnimation() {
        DispatchQueue.main.async {
            let activityData = ActivityData(type: .lineScalePulseOutRapid,
                                            color: AppColor.orange,
                                            backgroundColor : UIColor.black.withAlphaComponent(0.2))
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        }
    }
    
    static func stopIndicatorAnimation() {
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }

    static func imageViewWithIcon(_ icon: UIImage, raster: CGFloat) -> UIView {
        let imgView = UIImageView(image: icon)
        imgView.translatesAutoresizingMaskIntoConstraints = false

        imgView.contentMode = .center
        imgView.tintColor = UIColor(red: 0.75, green: 0, blue: 0, alpha: 1)

        let container = UIView()
        container.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: raster, bottom: 0, trailing: raster)
        container.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: container.layoutMarginsGuide.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: container.layoutMarginsGuide.trailingAnchor),
            imgView.topAnchor.constraint(equalTo: container.layoutMarginsGuide.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: container.layoutMarginsGuide.bottomAnchor)
        ])

        return container
    }

}

protocol IndicatorProtocol
{
    func startAnimation();
    func stopAnimation();
}


extension IndicatorProtocol
{
    func startAnimation()
    {
        Utility.startIndicatorAnimation()
    }
    
    func stopAnimation()
    {
        Utility.stopIndicatorAnimation()
    }
}
