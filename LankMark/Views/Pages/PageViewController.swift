//
//  PageViewController.swift
//  LankMark
//
//  Created by 최준영 on 2022/10/11.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    //SwiftUI calls this method before makeUIViewController(context:)
    //so that you have access to the coordinator object when configuring your view controller.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //SwiftUI calls this method a single time when it’s ready to display the view
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        
        //provide a view controller(UIHostingController) for display.
        pageViewController.setViewControllers(
            [context.coordinator.controllers[self.currentPage]], direction: .forward, animated: true)
    }
    
    //-----------------------Cordinator Structure-----------------------
    //A SwiftUI view that represents a UIKit view controller can define a Coordinator type
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers: [UIViewController]

        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
            
            //UIHostingController hosts the page SwiftUI view
            self.controllers = pageViewController.pages.map { UIHostingController(rootView: $0) }
        }
        
        //-----------------------DataSource-----------------------
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        //--------------------------------------------------------
        
        
        //-----------------------Delegate-----------------------
        
        //SwiftUI calls this method whenever a page switching animation completes
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = controllers.firstIndex(of: visibleViewController) {
                    parent.currentPage = index
            }
        }
    }
}
