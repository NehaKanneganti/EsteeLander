//
//  QuestionData.swift
//  promotionline
//
//  Created by Neha Kanneganti on 7/20/22.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple
}

struct Answer {
    var text: String
    var type: SkinType
}

enum SkinType: String {
    case lines = "Wrinkles/Fine Lines", firmness = "Loss of Firmness", pores = "Pores", dull = "Dull Skin", nopores = "*", nodull = "-", nolines = "+", nofirmness = "&"
    
    var definition: String {
        switch self {
        case .lines:
            return "Fine lines and wrinkles are a natural part of aging. For a more youthful appearance, we recommend using the Advanced Night Repair Eye Supercharged Gel-Creme and the Advanced Night Repair Serum. "
        case .firmness:
            return "Loss of firmness and sagging skin are the result of age, sun damage, dehydration and other factors. We recommend the Reignite Your Radiance: Repair Serum + Moisturizer."
        case .pores:
            return "Oily skin is most likely to have enlarged pores. We recommend adding the Advanced Night Repair Serum and/or Micro Essence to your routine."
        case .dull:
            return "Tired-looking skin and loss of radiance can be a result of lack of cell turnover and dehydration. To revitalize skin, we recommend using the Advanced Night Repair PowerFoil Mask and Advanced Night Repair Eye Supercharged Gel-Creme."
        case .nopores:
            return "Good Skin"
        case .nodull:
            return "Good Skin"
        case .nofirmness:
            return "Good Skin"
        case .nolines:
            return "Good Skin"

        }
    }
    
}
