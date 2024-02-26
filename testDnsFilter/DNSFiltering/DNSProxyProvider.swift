//
//  DNSProxyProvider.swift
//  DNSFiltering
//
//  Created by Juben Rana on 2/20/24.
//

import NetworkExtension
import os.log

class DNSProxyProvider: NEDNSProxyProvider {
    // MARK: - Logger
    
    static let logger = Logger(subsystem: "edu.stanford.sml.rdahlke.controlShift", category: "dns-filter")
    
    override init() {
        Self.logger.log(level: .debug, "TestDns: dns proxy provider will init")
        self.logger = Self.logger
        super.init()
    }
    
    let logger: Logger
    

    override func startProxy(options:[String: Any]? = nil, completionHandler: @escaping (Error?) -> Void) {
        // Add code here to start the DNS proxy.
        logger.log(level: .debug, "TestDns: proxy will start")
        completionHandler(nil)
    }

    override func stopProxy(with reason: NEProviderStopReason, completionHandler: @escaping () -> Void) {
        // Add code here to stop the DNS proxy.
        logger.log(level: .debug, "TestDns: proxy will stop")
        completionHandler()
    }

    override func sleep(completionHandler: @escaping () -> Void) {
        // Add code here to get ready to sleep.
        completionHandler()
    }

    override func wake() {
        // Add code here to wake up.
    }

    override func handleNewFlow(_ flow: NEAppProxyFlow) -> Bool {
        // Add code here to handle the incoming flow.
        logger.log(level: .debug, "TestDns: proxy is handling flow")

        return false
    }

}
