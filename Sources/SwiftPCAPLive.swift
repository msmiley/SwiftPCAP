import CPcap
import Foundation

extension SwiftPCAP {
  ///
  /// Class implementing live packet capture using libpcap
  ///
  /// Uses libpcap through the CPcap wrapper.
  ///
  public class Live: Base {
      
    /// the libpcap buffer size (default 100MB)
    var bufferSize: Int32
    
    /// the libpcap snaplen
    var snaplen: Int32
      
    ///
    /// Initializer takes the interface name
    ///
    /// - parameter interface: The name of the interface to open
    /// - parameter bufferSize: The size of the libpcap input buffer
    /// - parameter snaplen: The libpcap snaplen parameter (packet size to capture)
    ///
    public init(interface: String, bufferSize: Int32 = 104857600, snaplen: Int32 = 8192) throws {
      // initialize Live capture parameters
      self.bufferSize = bufferSize
      self.snaplen = snaplen

      super.init()
      
      // prepare error buffer for libpcap to use
      let errbuf = UnsafeMutablePointer<Int8>.allocate(capacity: Int(PCAP_ERRBUF_SIZE))
      
      // create the pcap_t handle for live capture
      pd = pcap_create(interface, errbuf)

      if (pd == nil) {
        throw Errors.errorMessage(msg: String(cString: errbuf))
      }

      // private func to set all live capture options
      try setOptions()
      
      // activate the live capture handle
      pcap_activate(pd);
    }

    ///
    /// Set live-capture libpcap options
    ///
    /// - throws: SwiftPCAP.Errors
    ///
    private func setOptions() throws {
      // libpcap options
      // currently no error handling, may want to add that
      try handleReturnCode(pcap_set_buffer_size(pd, self.bufferSize))
      try handleReturnCode(pcap_set_snaplen(pd, self.snaplen))
      try handleReturnCode(pcap_set_promisc(pd, 1))
      try handleReturnCode(pcap_set_timeout(pd, 1))
      try handleReturnCode(pcap_setnonblock(pd, 1, nil))
    }
  }

}
