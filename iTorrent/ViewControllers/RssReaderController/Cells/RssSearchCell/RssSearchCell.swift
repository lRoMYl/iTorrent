//
//  RssSearchCell.swift
//  iTorrent
//
//  Created by Daniil Vinogradov on 20.10.2020.
//  Copyright © 2020  XITRIX. All rights reserved.
//

import UIKit

class RssSearchCell: UITableViewCell {
    static let id = "RssSearchCell"
    static let nib = UINib(nibName: id, bundle: Bundle.main)
    
    @IBOutlet var title: ThemedUILabel!
    @IBOutlet var descriptionText: ThemedUILabel!
    @IBOutlet var date: ThemedUILabel!
    @IBOutlet var imageFav: UIImageView!
    @IBOutlet var newIcon: TintView!
    
    func setModel(_ model: RssSearchItem) {
        title.text = model.item.title
        descriptionText.text = model.rss.displayTitle
        
        if let datet = model.item.date {
            let now = Date()
            date.isHidden = false
            date.text = now.offset(from: datet)
        } else {
            date.isHidden = true
        }
        
        imageFav.image = UIImage(named: "Rss")
        imageFav.load(url: model.rss.linkImage)
        
        title.colorType = model.item.readed ? .secondary : .primary
        newIcon.isHidden = !model.item.new
    }
}