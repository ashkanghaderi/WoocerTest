//
//  HomeViewController.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import UIKit
import RxSwift
import RxCocoa
import Domain
import NetworkPlatform


class HomeViewController: BaseViewController {
    
   
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.register(ProductCollectionViewCell.self)
        }
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeightCons: NSLayoutConstraint!
    @IBOutlet weak var userImageContainerLabel: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var userImageContainer: BorderedView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    var viewModel: HomeViewModel!
   
    var isLoading: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindData()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    
    func setupUI(){
        
        userName.font = Fonts.Bold.Bold14()
        userName.textColor = AppColor.black
        
        self.userImageContainerLabel.font = Fonts.Bold.Bold18()
        self.userImageContainerLabel.textColor = UIColor.white
        
        userImageContainer.layer.borderWidth = 1.0
        userImageContainer.layer.masksToBounds = false
        userImageContainer.layer.borderColor = AppColor.Steel.cgColor
        userImageContainer.layer.cornerRadius = userImageContainer.frame.size.width / 2
        userImageContainer.clipsToBounds = true

    }
    
    func bindData() {
        
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        
        let input = HomeViewModel.Input(viewWillAppearTrigger:  viewWillAppear, profileTrigger: profileBtn.rx.tap.asDriver())
        
        let output = viewModel.transform(input: input)
        
        [output.profileAction.drive(),
        
         output.products.drive(collectionView.rx.items(cellIdentifier: ProductCollectionViewCell.reuseID, cellType: ProductCollectionViewCell.self)) { cv, viewModel, cell in
             cell.bind(viewModel)
         },
        
        output.userName.drive(userName.rx.text),output.imageUrl.drive(avatarBinding),output.error.drive(errorBinding),output.isFetching.drive(fetchingBinding)].forEach { (item) in
            item.disposed(by: disposeBag)
        }
    }
    
    var errorBinding: Binder<Error> {
        return Binder(self, binding: { (vc, error) in
            
            vc.ShowSnackBar(snackModel: SnackModel(title: error.localizedDescription , duration: 5))
            
        })
    }
    
    var avatarBinding: Binder<String> {
        return Binder(self, binding: { (vc, url) in
            self.updateUserInfo(userAvatar: url)
            
        })
    }
    
    var fetchingBinding: Binder<Bool> {
        return Binder(self, binding: { (vc, status) in
            
            if status == true {
                self.startAnimation()
            } else {
                self.stopAnimation()
            }
        })
    }
    
    private func updateUserInfo(userAvatar: String?){
        if let usrAvatar = userAvatar {
            if let url = URL(string: usrAvatar) {
                self.userImageView.isHidden = false
                self.userImageView.kf.setImage(with: url)
                self.userImageContainer.backgroundColor = UIColor.clear
                self.userImageContainerLabel.isHidden = true
            } else {
                self.userImageView.isHidden = true
                self.userImageContainer.backgroundColor = UIColor.random()
                self.userImageContainerLabel.isHidden = false
                self.userImageContainerLabel.text = self.userName.text?.prefix(1).uppercased()
            }
            
        } else {
            self.userImageView.isHidden = true
            self.userImageContainer.backgroundColor = UIColor.random()
            self.userImageContainerLabel.isHidden = false
            self.userImageContainerLabel.text = self.userName.text?.prefix(1).uppercased()
        }
    }
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

            return CGSize(width: size, height: 220)


    }
}
