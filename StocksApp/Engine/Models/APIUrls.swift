
import Foundation

struct APIUrls {
    static let baseUrl = "https://finnhub.io/api/v1"
    private static let token = "cfhtr4hr01qq9nt1lbb0cfhtr4hr01qq9nt1lbbg"
    struct Search {
        static func searchSymbol(query: String) -> String {
            return "\(APIUrls.baseUrl)/search?q=\(query)&token=cfhtr4hr01qq9nt1lbb0cfhtr4hr01qq9nt1lbbg"
        }
    }
    struct FinancialItems {
        struct Stocks {
            static func companyProfileBySymbol(symbol: String) -> String {
                return "\(APIUrls.baseUrl)/stock/profile2?symbol=\(symbol)&token=cfhtr4hr01qq9nt1lbb0cfhtr4hr01qq9nt1lbbg"
            }
            static func quote(symbol: String) -> String {
                return "\(APIUrls.baseUrl)/quote?symbol=\(symbol)&token=\(APIUrls.token)"
            }
        }
    }
}
