//
//  Request+Extension.swift
//  DailyNews
//
//  Created by Viet Anh on 03/01/2022.
//

import Alamofire

extension Request {
   public func debugLog() -> Self {
      #if DEBUG
         cURLDescription(calling: { (curl) in
              debugPrint("=======================================")
              print(curl)
              debugPrint("=======================================")
         })
      #endif
      return self
   }
}
