//  EventsTableViewCell.swift
//  FishBowl
//
//  Created by Viviane Chan on 2016-08-08.
//  Edited by Yevhen Kim
//  Copyright © 2016 Komrad.io . All rights reserved.

import UIKit
import Material

public struct DefaultOptions {
    public struct ImageView {
        public struct Padding {
            public static let Vertical = CGFloat(10.0)
            public static let Horizontal = CGFloat(10.0)
        }
    }
    public struct Label {
        public struct Padding {
            public static let Vertical = CGFloat(10.0)
            public static let Horizontal = CGFloat(10.0)
        }
    }
}

public class EventsTableViewCell: UITableViewCell {
    public lazy var defaultImageView: UIImageView = UIImageView()
    public lazy var defaultLabel: UILabel = UILabel()
    public lazy var defaultDescription: UILabel = UILabel()
    public lazy var defaultParticipants: UILabel = UILabel()
    public lazy var defaultDate: UILabel = UILabel()
    public lazy var menumodel: MenuModel = MenuModel()
    
    /*
    @name   required initWithCoder
    */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
    @name   init
    */
    public override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareDefaultLabel()
        prepareDefaultDescription()
        prepareDefaultParticipants()
        prepareDefaultDate()

    }
    
    /*
    @name   layoutSubviews
    */
    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutDefaultLabel()
        layoutDefaultDescription()
        layoutDefaultParticipants()
        layoutDefaultDate()

    }
    
    /*
    @name   prepareDefaultLabel (Events Title)
    */
    public func prepareDefaultLabel() {
        defaultLabel.font = Fonts.bodyGrey
        defaultLabel.numberOfLines = 0
        defaultLabel.textColor = Color.greyDark
        defaultLabel.textAlignment = .Left
        addSubview(defaultLabel)
    }
    
    /*
     @name   prepareDefaultDescription (Events Date)
     */
    public func prepareDefaultDescription() {
        defaultDescription.font = Fonts.smallfont
        defaultDescription.backgroundColor = MaterialColor.grey.lighten2
        defaultDescription.textColor = Color.greyDark
        defaultDescription.textAlignment = .Left
        addSubview(defaultDescription)
    }
    
    /*
     @name   prepareDefaultParticipants
     */
    public func prepareDefaultParticipants() {
        defaultParticipants.font = Fonts.smallfont
        defaultParticipants.textColor = Color.greyMedium
        defaultParticipants.textAlignment = .Left
        addSubview(defaultParticipants)
    }
    
    /*
     @name   prepareDefaultDate
     */
    public func prepareDefaultDate() {
        defaultDate.font = Fonts.bodyGrey
        defaultDate.textColor = Color.greyMedium
        defaultDate.textAlignment = .Left
        addSubview(defaultDate)
    }
    
    /*
    @name   layout labels
    */
    public func layoutDefaultLabel() {
        let x = CGFloat(20.0)
        let y = CGFloat(20.0)
        let w = contentView.frame.width - (40.0)
        let h = CGFloat(60.0)
        defaultLabel.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    public func layoutDefaultDescription() {
        let x = CGFloat(0.0)
        let y = CGFloat(0.0)
        let w = contentView.frame.width
        let h = CGFloat(20.0)
        defaultDescription.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    public func layoutDefaultParticipants() {
        let x = CGFloat(20.0)
        let y = CGFloat(80.0)
        let w = contentView.frame.width - (40.0)
        let h = CGFloat(20.0)
        defaultParticipants.frame = CGRect(x: x, y: y, width: w, height: h)
    }

    public func layoutDefaultDate() {
        let x = contentView.frame.width - (80.0)
        let y = (contentView.bounds.size.height / 8 * 5) - (15.0)
        let w = CGFloat(80.0)
        let h = CGFloat(30.0)
        defaultDate.frame = CGRect(x: x, y: y, width: w, height: h)
    }
}
