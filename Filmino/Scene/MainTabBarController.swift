//
//  MainTabBarController.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 7.06.2024.
//

import UIKit

//class MainTabBarController: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//        // MOVIES
//        let movieViewController = MoviesViewController()
//        movieViewController.viewModel = MoviesViewModel(mediaRepository: MediaRepository())
//        movieViewController.title = "MOVIES"
//        movieViewController.tabBarItem.image = UIImage(systemName: "popcorn")
//        movieViewController.tabBarItem.selectedImage = UIImage(systemName: "popcorn.fill")
//        let movieNavigationController = UINavigationController(rootViewController: movieViewController)
//        
//        
//        // SHOWS
//        let showsViewController = ShowsViewController()
//        showsViewController.viewModel = ShowsViewModel(mediaRepository: MediaRepository())
//        showsViewController.title = "SHOWS"
//        showsViewController.tabBarItem.image = UIImage(systemName: "tv")
//        showsViewController.tabBarItem.selectedImage = UIImage(systemName: "tv.fill")
//        let showsNavigationController = UINavigationController(rootViewController: showsViewController)
//        
//        
//        viewControllers = [showsNavigationController,
//                           movieNavigationController]
//    }
//}
