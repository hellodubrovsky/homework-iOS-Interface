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
        
        // Делаем из наших view контроллеров, новый стек navigationController.
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        
        // Создания item'ов в tabBar.
        let itemFeedView = UITabBarItem()
        let itemProfileView = UITabBarItem()
        
        // Добавление к tabBarItem'м заголовков.
        itemFeedView.title = "Feed"
        itemProfileView.title = "Profile"
        
        // Добавление изображения к item'м tabBarController'a.
        itemFeedView.image = UIImage(named: "feedScreenImage")?.withRenderingMode(.alwaysOriginal)
        itemProfileView.image = UIImage(named: "profileScreenImage")?.withRenderingMode(.alwaysOriginal)
        
        // Соединяем item'ы с нужными viewController'ми.
        feedNavigationController.tabBarItem = itemFeedView
        profileNavigationController.tabBarItem = itemProfileView
 
        // Возврат navigationController к реализации до iOS 13
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.34, green: 0.40, blue: 0.49, alpha: 0.1)
        feedNavigationController.navigationBar.scrollEdgeAppearance = appearance
        profileNavigationController.navigationBar.scrollEdgeAppearance = appearance
        
        // Создание tabBar и добавление в него, навигационных стеков, и по умолчаниию, выбираем экран с постами.
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        tabBarController.selectedViewController = feedNavigationController
        
        // Изменяем дизайн tabBar.
        tabBarController.tabBar.layer.borderWidth = 0.3
        tabBarController.tabBar.layer.borderColor = UIColor(red: CGFloat(253.0 / 255.0), green: CGFloat(112.0 / 255.0), blue: CGFloat(20.0 / 255.0), alpha: CGFloat(1.0)).cgColor
        tabBarController.tabBar.backgroundColor = UIColor(red: CGFloat(238.0 / 255.0), green: CGFloat(238.0 / 255.0), blue: CGFloat(238.0 / 255.0), alpha: CGFloat(1.0))
        
        // Изменение цвета заголовка у активных и неактивных tabBarItem'в.
        tabBarController.tabBar.tintColor = UIColor(red: CGFloat(253.0 / 255.0), green: CGFloat(112.0 / 255.0), blue: CGFloat(20.0 / 255.0), alpha: CGFloat(1.0))
        tabBarController.tabBar.unselectedItemTintColor = .black
        
        // Делаем tabBar ключевым в нашем окне.
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
