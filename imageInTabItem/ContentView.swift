//
//  ContentView.swift
//  imageInTabItem
//
//  Created by mgsulaiman on 06/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTag = 0
    var body: some View {
        NavigationStack {
            TabBarControllerRepresentable(tabBarItems: tabBarItems(), selectedTag: $selectedTag)
                .accentColor(.black)
        }
    }
    func tabBarItems() -> [TabBarItemInfo] {
        var arrayOfTabBarItems: [TabBarItemInfo] = []
        let imageSize = CGSize(width: 70, height: 50)
        let imageMidSize = CGSize(width: 75, height: 75)
        let imageInsets = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
        
        let homeImage = UIImage(systemName: "rectangle.grid.1x2.fill")
        
        let homeTabBarItem = TabBarItemInfo(view: AnyView(Text("first view")), image: homeImage, selectedImage: homeImage, renderingMode: .alwaysTemplate, imageInsets: nil, tag: 0)
        
        arrayOfTabBarItems.append(homeTabBarItem)
        
        if let emojiImage = UIImage(named: "perfectEmoji") {
            let resizedImage = UIGraphicsImageRenderer(size: imageMidSize).image { _ in
                emojiImage.draw(in: CGRect(origin: .zero, size: imageMidSize))
            }
            let perfectEmojiTabBarItem = TabBarItemInfo(view: AnyView(Text("second view")), image: resizedImage, selectedImage: resizedImage, renderingMode: .alwaysOriginal, imageInsets: imageInsets, tag: 1)
            arrayOfTabBarItems.append(perfectEmojiTabBarItem)
        }
        
        if let myImage = UIImage(named: "3dChat") {
            let resizedImage = UIGraphicsImageRenderer(size: imageSize).image { _ in
                myImage.draw(in: CGRect(origin: .zero, size: imageSize))
            }
            let chatsTabBarItem = TabBarItemInfo(view: AnyView(Text("third view")), image: resizedImage, selectedImage: resizedImage, renderingMode: .alwaysOriginal, imageInsets: nil, tag: 3)
            arrayOfTabBarItems.append(chatsTabBarItem)
        }
        
        return arrayOfTabBarItems
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


