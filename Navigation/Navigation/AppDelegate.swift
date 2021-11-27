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
        
        
        /*  * 1. Создайте новый проект с названием Navigation, используя шаблон Single View App.
            * 2. Удалите из проекта Main.storyboard, который создался по умолчанию. Не забудьте изменить конфигурацию в Info.plist.
            * 3. В AppDelegate.swift добавьте UITabBarController.
               Добавьте в него два UINavigationController. Первый будет показывать ленту пользователя, а второй — профиль.
            * 4. Измените Tab Bar Item у добавленных контроллеров, добавьте заголовок и картинку.
               Картинки можно добавить в Assets.xcassets или использовать SF Symbols.
            5. Создайте FeedViewController и ProfileViewController и добавьте их как root view controller у навигационных контроллеров.
            6. Добавьте PostViewController для показа выбранного поста. Поменяйте заголовок у контроллера и цвет главной view.
               Добавьте кнопку на FeedViewController и сделайте переход на экран поста. Контроллер должен показаться в стеке UINavigationController.
            7. Создайте структуру Post со свойством title: String. Создайте объект типа Post в FeedViewController и передайте его в PostViewController.
               В классе PostViewController выставьте title полученного поста в качестве заголовка контроллера.
            8. На PostViewController добавьте Bar Button Item в навигейшн бар. При нажатии на него должен открываться новый контроллер InfoViewController.
               Контроллер должен показаться модально.
            9. На InfoViewController создайте кнопку. При нажатии на неё должен показаться UIAlertController с заданным title, message и двумя UIAlertAction.
               При нажатии на UIAlertAction в консоль должно выводиться сообщение..*/
        
        // Перечисление дочерних контроллеров.
        let postViewController = PostViewController()
        let profileViewController = ProfileViewController()
        
        // Создание заголовков для контроллеров.
        postViewController.title = "Post"
        profileViewController.title = "Profile"
        
        // Создания item'ов в tabBar.
        let itemPostView = UITabBarItem()
        let itemProfileView = UITabBarItem()
        
        // Соединяем item'ы с нужными viewController'ми.
        postViewController.tabBarItem = itemPostView
        profileViewController.tabBarItem = itemProfileView
        
        // Добавление изображения к item'м tabBarController'a.
        itemPostView.image = UIImage(named: "postScreenImage")?.withRenderingMode(.alwaysOriginal)
        itemProfileView.image = UIImage(named: "profileScreenImage")?.withRenderingMode(.alwaysOriginal)
        
        // Делаем из наших контроллеров, новый стек.
        let postNavigationController = UINavigationController(rootViewController: postViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        
        // Создание tabBar и добавление в него, навигационных стеков, и по умолчаниию, выбираем экран с постами.
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [postNavigationController, profileNavigationController]
        tabBarController.selectedViewController = postNavigationController
        
        // Делаем tabBar ключевым в нашем окне.
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
