//
//  ViewController.swift
//  ImageDownloadManager
//
//  Created by KSH on 2023/02/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        setupAutoLayout()
    }
    
    // MARK: - addSubview()
    func addSubview() {
        view.addSubview(collectionView)
        view.addSubview(button)
    }
    
    // MARK: - Setup UI
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemPink
        return cv
    }()
    
    let button: UIButton = {
       let bt = UIButton()
        bt.setTitle("Load All Images", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        bt.backgroundColor = .systemBlue
        bt.layer.cornerRadius = 8 // 모서리 굴곡
        return bt
    }()
    
    // MARK: - Auto Layout()
    func setupAutoLayout() {
        collectionView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalTo(view.snp.left).offset(20)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.bottom.equalTo(view.snp.top).offset(UIScreen.main.bounds.height / 1.2)
        }
        
        button.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(30)
            $0.left.equalTo(view.snp.left).offset(20)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.bottom.equalTo(view.snp.bottom).offset(-60)
        }
    }
    
}

