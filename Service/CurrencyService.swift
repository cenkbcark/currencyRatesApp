import Foundation

class CurrencService {
    
    static let shared = CurrencService()
    
    func getCurrency(url: String, completion: @escaping (CurrencyResponseModel) -> ()) {
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let currencyDecode = try JSONDecoder().decode(CurrencyResponseModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(currencyDecode)
                        }
                    } catch let error {
                        print("can not be decoded \(error)")
                    }
                } else {
                    print("no data")
                }
            }
            .resume()
        } else {
            print("invalid URL")
        }
    }
}
