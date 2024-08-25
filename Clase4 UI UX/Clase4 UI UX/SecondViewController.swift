import UIKit

struct Model {
    let iconImageView: UIImage?
    let titleLabel: String
    let subtitleLabel: String
}

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let myCellModel: [Model] = [
        Model(iconImageView: UIImage(named: "image1"), titleLabel: "Listening to Green Grass of Tunnels", subtitleLabel: "MUM - Finally we are no one 2022"),
        Model(iconImageView: UIImage(named: "image2"), titleLabel: "Listening to Green Grass of Tunnels", subtitleLabel: "MUM - Finally we are no one 2022"),
        Model(iconImageView: UIImage(named: "image3"), titleLabel: "Listening to Green Grass of Tunnels", subtitleLabel: "MUM - Finally we are no one 2022"),
        Model(iconImageView: UIImage(named: "image4"), titleLabel: "Listening to Green Grass of Tunnels", subtitleLabel: "MUM - Finally we are no one 2022"),
    ]
    
    let topContainerView = UIView()
    let bottomContainerView = UIView()
    
    let profilePhotoView = UIImageView()
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    
    let musicIcon = UIImageView()
    let musicLabel = UILabel()
    
    let peopleIcon = UIImageView()
    let peopleLabel = UILabel()
    
    let heartIcon = UIImageView()
    let heartLabel = UILabel()
    
    var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        setUI()
    }
    
    func setUI() {
        setupTopContainerView()
        setupBottomContainerView()
        setupProfilePhotoView()
        setupStackView()
    }
    
    func setupTopContainerView() {
        topContainerView.backgroundColor = UIColor(red: 204/255, green: 92/255, blue: 76/255, alpha: 1)
        view.addSubview(topContainerView)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    func setupBottomContainerView() {
        bottomContainerView.backgroundColor = .gray.withAlphaComponent(0.8)
        view.addSubview(bottomContainerView)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor),
            bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumInteritemSpacing = 16
        
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.backgroundColor = .white
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(MyCustomCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
        bottomContainerView.addSubview(myCollectionView)
        
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor)
        ])
    }
    
    func setupProfilePhotoView() {
        profilePhotoView.image = UIImage(named: "profilePhoto")
        profilePhotoView.layer.cornerRadius = 75
        profilePhotoView.clipsToBounds = true
        topContainerView.addSubview(profilePhotoView)
        profilePhotoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profilePhotoView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: -30),
            profilePhotoView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            profilePhotoView.widthAnchor.constraint(equalToConstant: 150),
            profilePhotoView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        nameLabel.text = "Laura Kalbag"
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        topContainerView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profilePhotoView.bottomAnchor, constant: 15),
            nameLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor)
        ])
        
        descriptionLabel.text = "Love the way music makes me feel"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        topContainerView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor)
        ])
    }
    
    func setupStackView() {
        let musicIconStackView = UIStackView(arrangedSubviews: [musicIcon, musicLabel])
        let heartIconStackView = UIStackView(arrangedSubviews: [heartIcon, heartLabel])
        let peopleIconStackView = UIStackView(arrangedSubviews: [peopleIcon, peopleLabel])
        
        let musicStackView = UIStackView(arrangedSubviews: [
            musicIconStackView,
            peopleIconStackView,
            heartIconStackView,
        ])
        
        [musicIconStackView, heartIconStackView, peopleIconStackView].forEach {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .center
            $0.spacing = 4
        }
        
        musicStackView.axis = .horizontal
        musicStackView.distribution = .equalSpacing
        musicStackView.alignment = .center
        musicStackView.spacing = 10
        topContainerView.addSubview(musicStackView)
        musicStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            musicStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            musicStackView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            musicStackView.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor),
            musicStackView.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.8),
            musicStackView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.1)
        ])
        
        //music setup
        musicIcon.image = UIImage(systemName: "music.note")
        musicLabel.text = "127"
        musicIcon.tintColor = .white
        musicLabel.textColor = .white
        
        peopleIcon.image = UIImage(systemName: "person.2.fill")
        peopleLabel.text = "2261"
        peopleIcon.tintColor = .white
        peopleLabel.textColor = .white
        
        heartIcon.image = UIImage(systemName: "heart.fill")
        heartLabel.text = "5531"
        heartIcon.tintColor = .white
        heartLabel.textColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCellModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCustomCollectionViewCell
        let model = myCellModel[indexPath.item]
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with model: Model) {
        iconImageView.image = model.iconImageView
        titleLabel.text = model.titleLabel
        subtitleLabel.text = model.subtitleLabel
    }
}
