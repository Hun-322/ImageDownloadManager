//
//  ImageDownloadCollectionViewCell.swift
//  ImageDownloadManager
//
//  Created by KSH on 2023/02/27.
//

import UIKit

class ImageDownloadCollectionViewCell: UICollectionViewCell {
    var imageURL: String?
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview()
        setupAutoLayout()
        setupAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubview()
    func addSubview() {
        addSubview(downloadStackView)
    }
    
    // 버튼 클릭 시 이벤트 처리
    func setupAddTarget() {
        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
    }
    
    // loadButton 클릭 이벤트
    @objc func loadButtonTapped() {
        // 현재 이미지 리소스 이름
        let currentImage = imageView.image?.accessibilityIdentifier
        
        guard let imageURL = imageURL else { return }
        
        if currentImage != imageURL {
            imageView.image = UIImage(imageLiteralResourceName: "photo")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.imageView.loadFrom(URLAddress: imageURL)
        }
        
    }
    
    // MARK: - Setup UI
    // 이미지 뷰
    let imageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage(imageLiteralResourceName: "photo")
        ImageView.contentMode = .scaleToFill
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

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data, let loadedImage = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self?.image = loadedImage
            }
        }.resume()
    }
}
