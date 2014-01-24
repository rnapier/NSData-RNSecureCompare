# NSData+RNSecureCompare

Consistent-time comparison category for `NSData`.

`isEqual:`-based comparisons stop comparing at the first difference. This can be used by attackers, in some situations, to determine a secret value by considering the time required to compare the values.

To avoid these timing attacks, you should compare secret data with a consistent-time comparison. "Consistent" means that the comparison is proportional to the total size of the data, not the similarity of the data being compared.

## Usage

```objc
#import "NSData+RNSecureCompare.h"

...
if ([secretData rnsc_isEqualInConsistentTime:otherData]) {
    // proceed
}
```
