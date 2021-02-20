//
//  ExampleViewController.swift
//  Chidori
//
//  Created by Christian Selig on 2021-02-17.
//

import UIKit

class ExampleViewController: UIViewController {
    var actionMappings: [UIAction.Identifier: UIActionHandler] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedPoint = tapGestureRecognizer.location(in: view)
        
        let chidoriMenu = ChidoriMenu(menu: existingMenu, summonPoint: tappedPoint)
        chidoriMenu.delegate = self
        present(chidoriMenu, animated: true, completion: nil)
    }
    
    private lazy var existingMenu: UIMenu = {
        var postActions: [UIMenuElement] = []

        let ident1 = UIAction.Identifier("upvote")
        actionMappings[ident1] = upvote(action:)
        let upvoteAction = UIAction(title: "Upvote", image: UIImage(systemName: "arrow.up"), identifier: ident1, handler: downvote(action:))
        postActions.append(upvoteAction)

        let ident2 = UIAction.Identifier("downvote")
        actionMappings[ident2] = downvote(action:)
        let downvoteAction = UIAction(title: "Downvote", image: UIImage(systemName: "arrow.down"), identifier: ident2, handler: downvote(action:))
        postActions.append(downvoteAction)
    
        let ident3 = UIAction.Identifier("save")
        actionMappings[ident3] = save(action:)
        let saveAction = UIAction(title: "Save", image: UIImage(systemName: "bookmark"), identifier: ident3, handler: downvote(action:))
        postActions.append(saveAction)
        
        let postMenu = UIMenu(title: "", image: nil, identifier: nil, options: [.displayInline], children: postActions)
        
        var shareActions: [UIMenuElement] = []
    
        let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), identifier: nil, handler: downvote(action:))
        shareActions.append(shareAction)
    
        let shareAsImageAction = UIAction(title: "Share as Image", image: UIImage(systemName: "photo"), identifier: nil, handler: downvote(action:))
        shareActions.append(shareAsImageAction)
    
        let shareMenu = UIMenu(title: "", image: nil, identifier: nil, options: [.displayInline], children: shareActions)
        
        return UIMenu(title: "", image: nil, identifier: nil, options: [.displayInline], children: [postMenu, shareMenu])
    }()
    
    private func upvote(action: UIAction) {
        print("Upvote called")
    }

    private func downvote(action: UIAction) {
        print("Downvote called")
    }

    private func save(action: UIAction) {
        print("Saved called")
    }
}

extension ExampleViewController: ChidoriDelegate {
    func didSelectAction(_ action: UIAction) {
        actionMappings[action.identifier]?(action)
    }
}
