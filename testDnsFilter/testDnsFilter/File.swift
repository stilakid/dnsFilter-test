//
//  ContentFilter.swift
//  controlShift
//
//  Created by Juben Rana on 9/28/23.
//
//  This is only for macOS

import Foundation
import NetworkExtension
import os.log


// MARK: - Content Filter
class ContentFilter {
    
    // MARK: - Set Up
    
    static let shared = ContentFilter()
    
    
    private init() {
        Self.logger.log(level: .debug, "content filter will init")
        self.logger = Self.logger
    }
    
    
    // MARK: - Logger
    
    
    static let logger = Logger(subsystem: "edu.stanford.stilakid.testDnsFilter", category: "content-filter")
    
    
    
    let logger: Logger
    
    
    // MARK: - DNS Filter
    
    
    private let manager = NEDNSProxyManager.shared()
    
    
    func enable() {
        loadAndUpdatePreferences {
            self.manager.localizedDescription = "DNSProxySample"
            
            let dnsProtocol = NEDNSProxyProviderProtocol()
            dnsProtocol.providerBundleIdentifier = "edu.stanford.stilakid.testDnsFilter.DNSFiltering"
            
            self.manager.providerProtocol = dnsProtocol
            self.manager.isEnabled = true
        }
    }
    
    func disable() {
        loadAndUpdatePreferences {
            self.manager.isEnabled = false
        }
    }
    
    private func loadAndUpdatePreferences(_ completion: @escaping () -> Void) {
        manager.loadFromPreferences { error in
            guard error == nil else {
                debugPrint("DNSProxySample.App: load error")
                return
            }
            
            completion()
            
            self.manager.saveToPreferences { (error) in
                guard error == nil else {
                    debugPrint("DNSProxySample.App: save error")
                    return
                }
                
                debugPrint("DNSProxySample.App: saved")
            }
        }
    }
}
    
    
    
    
    
