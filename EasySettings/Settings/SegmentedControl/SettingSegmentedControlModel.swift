//
//  SettingSegmentedControlModel.swift
//  Avalon2Tests
//
//  Created by Dennis Müller on 15.08.18.
//  Copyright © 2017 Quantm. All rights reserved.
//

import UIKit
import IGListKit

protocol SettingSegmentedControlConfiguration {
    func configured(_ setting: Setting.SegmentedControl) -> Setting.SegmentedControl
}

extension Setting {
    typealias SegmentedControl = SegmentedControlModel
    class SegmentedControlModel: Setting.BaseModel {
        
        // MARK: - Properties
        // ========== PROPERTIES ==========
        public var segments: [String] = []
        public var activeSegment: Int = 0
        public var segmentsWidth: CGFloat = 80
        public var reloadUIOnChange: Bool = false
        // ====================
        
        // MARK: - Initializers
        // ========== INITIALIZERS ==========
        override init(_ id: String) {
            super.init(id)
            height = 55
        }
        // ====================
        
        // MARK: - Overrides
        // ========== OVERRIDES ==========
        override var sectionController: ListSectionController {
            return Setting.SegmentedControlSection()
        }
        
        override func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            guard reloadUIOnChange else { return true }
            guard let object = object as? Setting.SegmentedControlModel, super.isEqual(toDiffableObject: object) else { return false }
            return self.segments == object.segments && self.activeSegment == object.activeSegment && self.segmentsWidth == object.segmentsWidth
        }
        // ====================
        
        
        // MARK: - Functions
        // ========== FUNCTIONS ==========
        
        // ====================
        
    }
    
}