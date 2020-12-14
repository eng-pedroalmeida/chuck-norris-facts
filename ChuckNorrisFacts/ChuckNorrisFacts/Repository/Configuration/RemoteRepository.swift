//
//  RemoteRepository.swift
//  ChuckNorrisFacts
//
//  Created by Pedro Almeida on 14/12/20.
//

import Alamofire
import RxSwift

class RemoteRepository {
    private let queueScheduler = ConcurrentDispatchQueueScheduler.init(
        queue: DispatchQueue(label: "<chuck_norris_queue>"))
    
    func request<T: Decodable>(_ endpoint: APIConfiguration) -> Single<T> {
        return Single<T>.create { observer in
            let request = AF.request(endpoint)
                .validate()
                .responseDecodable(completionHandler: { (response: DataResponse<T, AFError>) in
                    if let error = response.error {
                        observer(.failure(error))
                    }

                    switch response.result {
                        case let .success(val): observer(.success(val))
                        case let .failure(err): observer(.failure(err))
                    }
                })

            return Disposables.create {
                request.cancel()
            }
        }
        .subscribe(on: queueScheduler)
        .observe(on: MainScheduler.instance)
    }
}
