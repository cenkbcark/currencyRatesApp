import Foundation

struct CurrencyResponseModel: Decodable {
    
    let success: Bool?
    let timestamp: Int?
    let base: String?
    let date: String?
    let rates: RatesResponseModel?
}

struct RatesResponseModel: Decodable {
    
    let TRY: Double?
    let USD: Double?
    let CAD: Double?
    let LTL: Double?
    let GMD: Double?
}

