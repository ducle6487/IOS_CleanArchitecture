//
//  RoutingContract.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

@propertyWrapper
public struct RoutingContract<Contract>: Logging {
    public init() {}
    public var loggerType: LoggingComponent = .routing
    @Inject(\.contractFactory) var contractFactory: RouterContractFactory
    public var wrappedValue: Contract {
        log("Retrieving contract for \(Contract.self)")
        return resolveContract()
    }

    /// Resolve Contract
    /// Retreives the `routerContractFactory` on recall and resolves it to its contract type
    private func resolveContract() -> Contract {
        log("Resolving contract for \(Contract.self)")
        let contract = contractFactory as? Contract
        precondition(contract != nil, "No contract could be retrieved for \(Contract.self)")
        return contract!
    }
}
