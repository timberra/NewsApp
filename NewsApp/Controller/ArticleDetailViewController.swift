//
//  ArticleDetail.swift
//  NewsApp
//
//  Created by liga.griezne on 21/11/2023.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    private var article: Article

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageView = UIImageView()
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
        title = article.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = article.title
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.text = article.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        imageView.sd_setImage(with: URL(string: article.urlToImage ?? ""))
        imageView.contentMode = .scaleAspectFit // or .scaleAspectFill depending on your preference
        imageView.clipsToBounds = true

        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            descriptionLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200), // Adjust the height as needed
            imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
        ])

    }
}

