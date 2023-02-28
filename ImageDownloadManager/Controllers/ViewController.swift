//
//  ViewController.swift
//  ImageDownloadManager
//
//  Created by KSH on 2023/02/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let imageDownloadCollectionViewCellIdentifier = "ImageDownloadCollectionViewCell"
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        addSubview()
        setupAutoLayout()
    }
    
    // MARK: - addSubview()
    func addSubview() {
        view.addSubview(collectionView)
        view.addSubview(loadAllButton)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageDownloadCollectionViewCell.self, forCellWithReuseIdentifier: imageDownloadCollectionViewCellIdentifier)
    }
    
    // MARK: - Setup UI
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .systemPink
        return cv
    }()
    
    let loadAllButton: UIButton = {
       let btn = UIButton()
        btn.setTitle("Load All Images", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8 // 모서리 굴곡
        return btn
    }()
    
    // MARK: - Auto Layout()
    func setupAutoLayout() {
        collectionView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalTo(view.snp.left).offset(20)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.bottom.equalTo(view.snp.top).offset(UIScreen.main.bounds.height / 1.2)
        }
        
        loadAllButton.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
            $0.left.equalTo(view.snp.left).offset(20)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.bottom.equalTo(view.snp.bottom).offset(-60)
        }
    }
    
}
// MARK: - Extension

extension ViewController: UICollectionViewDataSource {
    // 섹션에 표시할 셀의 개수를 묻는 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // 컬렉션뷰의 지정된 위치에 표시할 셀을 요청하는 메서드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageDownloadCollectionViewCellIdentifier, for: indexPath) as! ImageDownloadCollectionViewCell
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // 셀 크기 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 5 - 10)
    }
}
