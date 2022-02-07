//
//  AppDelegate.swift
//  MyHabits
//
//  Created by Илья on 02.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Создание viewController'ов
        let habitsViewController = HabitsViewController()
        let infoViewController = InfoViewController()
        
        // Создание navigationController'ов
        let habitsNavigationController = UINavigationController(rootViewController: habitsViewController)
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)
        
        // Создание tabBarItem'ов
        let itemHabitsView = UITabBarItem()
        let itemInfoView = UITabBarItem()
        
        // Добавления иконок к tabBarItem'м
        itemHabitsView.image = UIImage(systemName: "command.square.fill")
        itemInfoView.image = UIImage(systemName: "info.circle.fill")
        
        // Добавление заголовков к tabBarItem'м
        itemHabitsView.title = "Привычки"
        itemInfoView.title = "Информация"
        
        // Возврат navigationController к реализации до iOS 13
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "whiteColorApp")
        habitsNavigationController.navigationBar.scrollEdgeAppearance = appearance
        infoNavigationController.navigationBar.scrollEdgeAppearance = appearance
        
        // Присваиваем tabBarItem'м соответсующие контроллеры
        habitsNavigationController.tabBarItem = itemHabitsView
        infoNavigationController.tabBarItem = itemInfoView
        
        // Создание tabBarController'a
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [habitsNavigationController, infoNavigationController]
        tabBarController.selectedViewController = habitsNavigationController
        
        // Изменение цвета tabBarController'а
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .gray
        tabBarController.tabBar.backgroundColor = UIColor(named: "whiteColorApp")
        tabBarController.tabBar.layer.borderWidth = 1
        tabBarController.tabBar.layer.borderColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.29).cgColor
        
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        
        return true
    }
}
