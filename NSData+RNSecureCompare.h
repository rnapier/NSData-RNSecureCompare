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

#import <Foundation/Foundation.h>

@interface NSData (RNSecureCompare)

/** Compare two NSData in time proportional to the compared data (otherData)
 *
 * isEqual:-based comparisons stop comparing at the first difference. This can be used by attackers, in some situations,
 * to determine a secret value by considering the time required to compare the values.
 *
 * It is slightly better to call this as [secret rnsc_isEqualInConsistentTime:attackersData] rather than the reverse,
 * but it is not a major issue either way. In the first case, the time required is proportional to the attacker's data,
 * which provides the attacker no information about the length of secret. In the second case, the time is proportional
 * to the length of secret, which leaks a small amount of informaiont, but in a way that does not varry in proportion to
 * the attacker's data.
 *
 * @param otherData data to compare
 * @returns YES if values are equal
 */
- (BOOL)rnsc_isEqualInConsistentTime:(NSData *)otherData;

@end
