//
//  AppDelegate.swift
//  Navigation
//
//  Created by Илья on 26.11.2021.
//  Homework: https://github.com/netology-code/iosui-homeworks/tree/iosui-8/1.3



import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Окно, в котором может быть группа контроллеров. Все iOS приложения одноэкранные.
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Перечисление дочерних контроллеров.
        let feedViewController = FeedViewController()
        let profileViewController = ProfileViewController()
        
        // Создание заголовков для контроллеров.
        feedViewController.title = "Feed"
        profileViewController.title = "Profile"
        
        // Создания item'ов в tabBar.
        let itemFeedView = UITabBarItem()
        let itemProfileView = UITabBarItem()
        
        // Соединяем item'ы с нужными viewController'ми.
        feedViewController.tabBarItem = itemFeedView
        profileViewController.tabBarItem = itemProfileView
        
        // Добавление к tabBarItem'м заголовков.
        itemFeedView.title = "Feed"
        itemProfileView.title = "Profile"
        
//        itemFeedView.
        
        // Добавление изображения к item'м tabBarController'a.
        itemFeedView.image = UIImage(named: "feedScreenImage")?.withRenderingMode(.alwaysOriginal)
        itemProfileView.image = UIImage(named: "profileScreenImage")?.withRenderingMode(.alwaysOriginal)
        
        // Делаем из наших контроллеров, новый стек.
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        
        // Создание tabBar и добавление в него, навигационных стеков, и по умолчаниию, выбираем экран с постами.
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        tabBarController.selectedViewController = feedNavigationController
        
        tabBarController.tabBar.layer.borderWidth = 0.3
        tabBarController.tabBar.layer.borderColor = UIColor.systemGray3.cgColor
        tabBarController.tabBar.backgroundColor = .systemGray
        
        // Изменение цвета заголовка у активных и неактивных tabBarItem'в.
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .black
        
        // Делаем tabBar ключевым в нашем окне.
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
