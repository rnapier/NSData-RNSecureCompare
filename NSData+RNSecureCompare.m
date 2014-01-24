//
//  NSData+RNSecureCompare
//
//  Copyright (c) 2014 Rob Napier
//
//  This code is licensed under the MIT License:
//
//  Permission is hereby granted, free of charge, to any person obtaining a 
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "NSData+RNSecureCompare.h"

@implementation NSData (RNSecureCompare)

- (BOOL)rnsc_isEqualInConsistentTime:(NSData *)otherData {
  // The point of this routine is XOR the bytes of each data and accumulate the results with OR.
  // If any bytes are different, then the OR will accumulate some non-0 value.

  uint8_t result = otherData.length - self.length;  // Start with 0 (equal) only if our lengths are equal

  const uint8_t *myBytes = [self bytes];
  const NSUInteger myLength = [self length];
  const uint8_t *otherBytes = [otherData bytes];
  const NSUInteger otherLength = [otherData length];

  for (NSUInteger i = 0; i < otherLength; ++i) {
    // Use mod to wrap around ourselves if they are longer than we are.
    // Remember, we already broke equality if our lengths are different.
    result |= myBytes[i % myLength] ^ otherBytes[i];
  }

  return result == 0;
}

@end
