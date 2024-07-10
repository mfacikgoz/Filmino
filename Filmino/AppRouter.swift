//
//  AppRouter.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 9.07.2024.
//

import Foundation
import UIKit

enum AppRoute {
    case shows
    case movies
    case show(id: Int)
    case movie(id: Int)
    
    var viewController: UIViewController {
        
        switch self {
            
        case .shows:
            let viewController = ShowsViewController()
            viewController.viewModel = ShowsViewModel(mediaRepository: MediaRepository())
            viewController.title = "SHOWS"
            viewController.tabBarItem.image = UIImage(systemName: "tv")
            viewController.tabBarItem.selectedImage = UIImage(systemName: "tv.fill")
            return viewController
            
        case .movies:
            let viewController = MoviesViewController()
            viewController.viewModel = MoviesViewModel(mediaRepository: MediaRepository())
            viewController.title = "MOVIES"
            viewController.tabBarItem.image = UIImage(systemName: "popcorn")
            viewController.tabBarItem.selectedImage = UIImage(systemName: "popcorn.fill")
            return viewController
            
        case .show(let id):
            let viewController = ShowDetailViewController()
            viewController.viewModel = ShowDetailViewModel(mediaRepository: MediaRepository(), showId: id)
            return viewController
            
        case .movie(let id):
            let viewController = MovieDetailViewController()
            viewController.viewModel = MovieDetailViewModel(mediaRepository: MediaRepository(), movieId: id)
            return viewController
        }
    }
    
    private static var window: UIWindow?
    
    private var main: UITabBarController? {
        Self.window?.rootViewController as? UITabBarController
    }
    
    static func start(on scene: UIWindowScene) {
        
        window = UIWindow(windowScene: scene)
        
        let main = UITabBarController()
        
        let shows = Self.shows.viewController
        let movies = Self.movies.viewController
        
        main.viewControllers = [
            UINavigationController(rootViewController: shows),
            UINavigationController(rootViewController: movies)
        ]
        
        window?.rootViewController = main
        window?.makeKeyAndVisible()
    }
    
    func navigate() {
        
        switch self {
        case .shows:
            main?.selectedIndex = 0
            let nc = main?.selectedViewController as? UINavigationController
            nc?.popToRootViewController(animated: true)
            
        case .movies:
            main?.selectedIndex = 1
            let nc = main?.selectedViewController as? UINavigationController
            nc?.popToRootViewController(animated: true)
            
        case .show:
            main?.selectedIndex = 0
            let nc = main?.selectedViewController as? UINavigationController
            let vc = self.viewController
            nc?.pushViewController(vc, animated: true)
            
        case .movie:
            main?.selectedIndex = 1
            let nc = main?.selectedViewController as? UINavigationController
            let vc = self.viewController
            nc?.pushViewController(vc, animated: true)
        }
        
    }
}
