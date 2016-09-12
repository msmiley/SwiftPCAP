# SwiftPCAP

SwiftPCAP provides libpcap-based packet capture for Swift for both live and offline capture. You have the choice between handling a packet wrapped in a UnsafeBufferPointer or a safe version copied into a [UInt8].

## Usage

```swift

var pcap = try SwiftPCAP.Live("en0")

// safe Swift array (copied)
var pkt: [UInt8] = p.nextPacket()

// direct usage of unsafe buffer allocated by libpcap
// note that the buffer is valid until the next call to nextPacketUnsafe, at which point
// libpcap will delete
var pkt: UnsafeBufferPointer<u_char> = p.nextPacketUnsafe()

```


## Errors

SwiftPCAP throws errors based on libpcap errors.

libpcap throws two kinds of errors, one based on a char string, the other on int return codes. SwiftPCAP gathers all of these under SwiftPCAP.Errors.errorMessage(msg: String) using a humanized string from the comments of pcap.h.


## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.