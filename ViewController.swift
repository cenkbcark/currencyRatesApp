import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var currenciesLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllCurrency()
    }
    
    private func getAllCurrency() {
        
        CurrencService.shared.getCurrency(url: "http://data.fixer.io/api/latest?access_key=d08d4685eeb8e0383646da16218ee96d") { response in
            
            self.currenciesLabels.forEach { label in
                switch label.tag {
                case 0:
                    label.text = String(response.rates?.TRY ?? 0.0)
                case 1:
                    label.text = String(response.rates?.USD ?? 0.0)
                case 2:
                    label.text = String(response.rates?.CAD ?? 0.0)
                case 3:
                    label.text = String(response.rates?.LTL ?? 0.0)
                case 4:
                    label.text = String(response.rates?.GMD ?? 0.0)
                default:
                    break
                }
            }
        }
    }
}




