//
//  ImageDownloadCollectionViewCell.swift
//  ImageDownloadManager
//
//  Created by KSH on 2023/02/27.
//

import UIKit

class ImageDownloadCollectionViewCell: UICollectionViewCell {
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubview()
    func addSubview() {
        addSubview(downloadStackView)
    }
    
    // MARK: - Setup UI
    // 이미지 뷰
    let imageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage(imageLiteralResourceName: "photo")
        //ImageView.contentMode = .scaleToFill
        return ImageView
    }()
    
    // 프로그래스바
    let progressView: UIProgressView = {
        let pg = UIProgressView()
        pg.trackTintColor = .lightGray // 배경 색상
        pg.progressTintColor = .systemBlue // 진행 막대 색상
        pg.progress = 0.5
        return pg
    }()
    
    // 로드 버튼
    let loadButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Load", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8 // 모서리 굴곡
        return btn
    }()
    
    // 다운로드 스택 뷰
    private lazy var downloadStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [imageView, progressView, loadButton])
        // StackView를 채우기 위해 모든 Arrange Views들의 사이즈를 동일하게 분배
        stview.distribution = .fillEqually
        stview.alignment = .center // center를 StackView의 Center에 맞춰 정렬
        return stview
    }()
    
    func setupAutoLayout() {
        downloadStackView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        
    }
}
