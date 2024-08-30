//
//  HomeViewController.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 25/8/24.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: HEADER COMPONENTS
    let homeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, Alex!"
        label.textColor = UIColor.darkBlue
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let homeSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore Nicaragua"
        label.textColor = UIColor.darkBlue
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search your next trip..."
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let profileImageRounded: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // MARK: CATEGORIES COMPONENTS
    let categories: [TourismCategory] = [.adventure, .nature, .history, .beach, .health]

    let tourismCategoriesScrollView: UIScrollView = BuildHelper.createScrollView()
    
    let tourismCategoriesContentView: UIStackView = BuildHelper.createStackViewHorizontal()
    // MARK: MAIN PLACES COMPONENTS 
    let mainPlacesScrollView: UIScrollView = BuildHelper.createScrollView()
    
    let mainPlacesContentView = BuildHelper.createStackViewHorizontal()
    let mainPlacesTitle: UILabel = BuildHelper.createTitleLabel(with: "Popular Places")
    
    // MARK: RECOMMENDED TRIPS
    let recommendedTripsTitle: UILabel = BuildHelper.createTitleLabel(with: "Recommended Trips")
    let recommendedTripsScrollView: UIScrollView = BuildHelper.createScrollView()
    let recommendedTripsContentView = BuildHelper.createStackViewHorizontal()
    let recommendedTripsSegmentedControl = UISegmentedControl(items: ["Solo", "Family"])
    
    // MARK: MAIN SCROLLVIEW
    let mainScrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let mainContainer: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: City Sections
    
    let citySectionTitle: UILabel = BuildHelper.createTitleLabel(with: "Know Nicaragua more")
    let citySectionScrollView: UIScrollView = BuildHelper.createScrollView()
    let citySectionContentView = BuildHelper.createStackViewHorizontal()
    let cityModel = citySections
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
        
    }
    
    //MARK: setting mainPlaces
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainScrollView)
        
        
        setupHeader()
        setupCategories()
        setupCategoriesViews()
        setupMainPlaces()
        setupMainPlacesViews()
        setupRecommendedTrips()
        setupRecommendedTripsView()
        setupCities()
        setupCitiesView()
    }

    // agregando cosas al header.
    private func setupHeader(){
        //MARK: ADD SUBVIEWS
        mainScrollView.addSubview(mainContainer)
        mainContainer.addSubview(homeTitleLabel)
        mainContainer.addSubview(homeSubtitleLabel)
        mainContainer.addSubview(searchBar)
        mainContainer.addSubview(profileImageRounded)
        mainContainer.addSubview(tourismCategoriesScrollView)
        mainContainer.addSubview(mainPlacesScrollView)
        tourismCategoriesScrollView.addSubview(tourismCategoriesContentView)
                
        homeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        // MARK: CONSTRAINTS FOR HEADER
        NSLayoutConstraint.activate([
            
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainContainer.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            
            mainContainer.heightAnchor.constraint(equalToConstant: 965),
            
            homeTitleLabel.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor),
                homeTitleLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 20),
                
                homeSubtitleLabel.topAnchor.constraint(equalTo: homeTitleLabel.bottomAnchor, constant: 10),
                homeSubtitleLabel.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 20),
                
                searchBar.topAnchor.constraint(equalTo: homeSubtitleLabel.bottomAnchor, constant: 10),
                searchBar.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 10),
                searchBar.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -10),
                
                profileImageRounded.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor),
                profileImageRounded.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -20),
                profileImageRounded.widthAnchor.constraint(equalToConstant: 60),
                profileImageRounded.heightAnchor.constraint(equalToConstant: 60),
            
        ])
        
    }
    // MARK: CATEGORIES
    private func setupCategories() {
            NSLayoutConstraint.activate([
                // scroll view
                tourismCategoriesScrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
                tourismCategoriesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                tourismCategoriesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                tourismCategoriesScrollView.heightAnchor.constraint(equalToConstant: 60),
                
                // content view
                tourismCategoriesContentView.topAnchor.constraint(equalTo: tourismCategoriesScrollView.topAnchor),
                tourismCategoriesContentView.leadingAnchor.constraint(equalTo: tourismCategoriesScrollView.leadingAnchor),
                tourismCategoriesContentView.trailingAnchor.constraint(equalTo: tourismCategoriesScrollView.trailingAnchor),
                tourismCategoriesContentView.bottomAnchor.constraint(equalTo: tourismCategoriesScrollView.bottomAnchor),
                tourismCategoriesContentView.heightAnchor.constraint(equalTo: tourismCategoriesScrollView.heightAnchor)
            ])
        }
        
    private func setupCategoriesViews() {
        for category in categories {
            let categoryView = TourismCategoryView(category: category)
        /*
            categoryView.containerView.backgroundColor = TourismCategory.adventure.rawValue == "adventure" ? .lightBlue : .white
             categoryView.titleLabel.textColor = TourismCategory.adventure == category ? .white : .darkBlue
             categoryView.imageView.tintColor = TourismCategory.adventure == category ? .white : .darkBlue
             categoryView.layer.cornerRadius = 10*/
            tourismCategoriesContentView.addArrangedSubview(categoryView)
        }
    }

    // MARK: - Setup Main Places
    private func setupMainPlaces() {
        mainPlacesScrollView.addSubview(mainPlacesContentView)
        mainPlacesTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        mainContainer.addSubview(mainPlacesScrollView)
        mainContainer.addSubview(mainPlacesTitle)
        
        NSLayoutConstraint.activate([
            // Scroll view constraints
            
            mainPlacesTitle.topAnchor.constraint(equalTo: tourismCategoriesScrollView.bottomAnchor, constant: 10),
            mainPlacesTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            mainPlacesScrollView.topAnchor.constraint(equalTo: mainPlacesTitle.bottomAnchor, constant: 10),
            mainPlacesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainPlacesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainPlacesScrollView.heightAnchor.constraint(equalToConstant: 300),
            
            // Content view constraints
            mainPlacesContentView.topAnchor.constraint(equalTo: mainPlacesScrollView.topAnchor),
            mainPlacesContentView.leadingAnchor.constraint(equalTo: mainPlacesScrollView.leadingAnchor),
            mainPlacesContentView.trailingAnchor.constraint(equalTo: mainPlacesScrollView.trailingAnchor),
            mainPlacesContentView.bottomAnchor.constraint(equalTo: mainPlacesScrollView.bottomAnchor),
            mainPlacesContentView.heightAnchor.constraint(equalTo: mainPlacesScrollView.heightAnchor)
        ])
    }

    private func setupMainPlacesViews() {
        for mainPlace in mainPlaces {
            let mainPlaceView = MainPlacesView(mainPlaces: mainPlace)
            mainPlaceView.translatesAutoresizingMaskIntoConstraints = false
            
            mainPlacesContentView.addArrangedSubview(mainPlaceView)
            
            NSLayoutConstraint.activate([
                mainPlaceView.widthAnchor.constraint(equalToConstant: 200),
                mainPlaceView.heightAnchor.constraint(equalTo: mainPlacesContentView.heightAnchor)
            ])
        }
    }
    
    private func setupRecommendedTrips() {
        
       recommendedTripsSegmentedControl.selectedSegmentIndex = 0
       recommendedTripsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
       
       // setup color and font for selected
       let selectedTitleAttributes: [NSAttributedString.Key: Any] = [
           .foregroundColor: UIColor.white,
           .font: UIFont.systemFont(ofSize: 14, weight: .regular)
       ]
       //setup color and font for unselected
       let unselectedTitleAttributes: [NSAttributedString.Key: Any] = [
           .foregroundColor: UIColor.mainColor ?? UIColor.white,
           .font: UIFont.systemFont(ofSize: 14, weight: .regular)
       ]
       
       recommendedTripsSegmentedControl.setTitleTextAttributes(unselectedTitleAttributes, for: .normal)
       recommendedTripsSegmentedControl.setTitleTextAttributes(selectedTitleAttributes, for: .selected)
       
       recommendedTripsSegmentedControl.backgroundColor = .mainColor?.withAlphaComponent(0.2)
       recommendedTripsSegmentedControl.selectedSegmentTintColor = .mainColor
       recommendedTripsSegmentedControl.tintColor = .white
        
        recommendedTripsTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        mainContainer.addSubview(recommendedTripsSegmentedControl)
        mainContainer.addSubview(recommendedTripsScrollView)
        mainContainer.addSubview(recommendedTripsTitle)
        recommendedTripsScrollView.addSubview(recommendedTripsContentView)
        
        NSLayoutConstraint.activate([
        
            recommendedTripsTitle.topAnchor.constraint(equalTo: mainPlacesScrollView.bottomAnchor, constant: 10),
            recommendedTripsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            recommendedTripsSegmentedControl.topAnchor.constraint(equalTo: recommendedTripsTitle.bottomAnchor, constant: 10),
            recommendedTripsSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            recommendedTripsSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            recommendedTripsScrollView.topAnchor.constraint(equalTo: recommendedTripsSegmentedControl.bottomAnchor, constant: 10),
            recommendedTripsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            recommendedTripsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            recommendedTripsScrollView.heightAnchor.constraint(equalToConstant: 200),
            
            recommendedTripsContentView.topAnchor.constraint(equalTo: recommendedTripsScrollView.topAnchor),
            recommendedTripsContentView.leadingAnchor.constraint(equalTo: recommendedTripsScrollView.leadingAnchor),
            recommendedTripsContentView.trailingAnchor.constraint(equalTo: recommendedTripsScrollView.trailingAnchor),
            recommendedTripsContentView.heightAnchor.constraint(equalTo: recommendedTripsScrollView.heightAnchor)
        ])
    }
    
    private func setupRecommendedTripsView() {
        let recommendedTrips = recommendedTrips.filter { $0.modality.rawValue == recommendedTripsSegmentedControl.selectedSegmentIndex }
        for recommendedTrip in recommendedTrips {
            
            let recommendedTripsView = RecommendedTripsView(recommendedTrips: recommendedTrip)
            recommendedTripsView.translatesAutoresizingMaskIntoConstraints = false
            
            recommendedTripsContentView.addArrangedSubview(recommendedTripsView)
            
            NSLayoutConstraint.activate([
                recommendedTripsView.widthAnchor.constraint(equalToConstant: 200),
                recommendedTripsView.heightAnchor.constraint(equalTo: recommendedTripsContentView.heightAnchor)
            ])
        }
    }
    
    private func setupCities() {

        citySectionTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        mainContainer.addSubview(citySectionTitle)
        mainContainer.addSubview(citySectionScrollView)
        citySectionScrollView.addSubview(citySectionContentView)
        citySectionContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            citySectionTitle.topAnchor.constraint(equalTo: recommendedTripsScrollView.bottomAnchor, constant: 10),
            citySectionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            citySectionScrollView.topAnchor.constraint(equalTo: citySectionTitle.bottomAnchor, constant: 10),
            citySectionScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            citySectionScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            citySectionScrollView.heightAnchor.constraint(equalToConstant: 100),
            
            citySectionContentView.topAnchor.constraint(equalTo: citySectionScrollView.topAnchor),
            citySectionContentView.leadingAnchor.constraint(equalTo: citySectionScrollView.leadingAnchor),
            citySectionContentView.trailingAnchor.constraint(equalTo: citySectionScrollView.trailingAnchor),
            citySectionContentView.heightAnchor.constraint(equalTo: citySectionScrollView.heightAnchor)
        ])
    }
    private func setupCitiesView() {
        for city in cityModel {
            
            let cityView = CitySections(frame: .zero, city: city)
            cityView.translatesAutoresizingMaskIntoConstraints = false
            
            citySectionContentView.addArrangedSubview(cityView)
            
            NSLayoutConstraint.activate([
                cityView.widthAnchor.constraint(equalToConstant: 230),
                cityView.heightAnchor.constraint(equalTo: citySectionContentView.heightAnchor)
            ])
        }
    }
    
}
