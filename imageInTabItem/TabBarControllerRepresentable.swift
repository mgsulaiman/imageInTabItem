//
//  TabBarControllerRepresentable.swift
//  imageInTabItem
//
//  Created by mgsulaiman on 06/04/2023.
//

import SwiftUI
import UIKit

struct TabBarControllerRepresentable: UIViewControllerRepresentable {
    let tabBarItems: [TabBarItemInfo]
    @Binding var selectedTag: Int
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
           tabBarController.viewControllers = tabBarItems.map { item in
               let viewController = UIHostingController(rootView: item.view)
               let image = item.image?.withRenderingMode(item.renderingMode)
               let selectedImage = item.selectedImage?.withRenderingMode(item.renderingMode)
               viewController.tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
               if let imageInsets = item.imageInsets {
                   viewController.tabBarItem.imageInsets = imageInsets
               }
               viewController.tabBarItem.tag = item.tag
               return viewController
           }
        tabBarController.selectedIndex = selectedTag
          tabBarController.delegate = context.coordinator
        return tabBarController
    }

    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        uiViewController.selectedIndex = selectedTag
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITabBarControllerDelegate {
        let parent: TabBarControllerRepresentable

        init(_ parent: TabBarControllerRepresentable) {
            self.parent = parent
        }

        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            parent.selectedTag = tabBarController.selectedIndex
        }
    }
}

// TabBarItemInfo Model

struct TabBarItemInfo {
    let view: AnyView
     let image: UIImage?
     let selectedImage: UIImage?
     let renderingMode: UIImage.RenderingMode
     let imageInsets: UIEdgeInsets?
     let tag: Int
}



