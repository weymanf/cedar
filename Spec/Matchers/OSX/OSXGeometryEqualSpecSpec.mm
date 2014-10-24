#import <CoreGraphics/CoreGraphics.h>
#import "Cedar.h"

extern "C" {
#import "ExpectFailureWithMessage.h"
}


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(OSXGeometryEqualSpecSpec)

describe(@"CoreGraphics struct comparisons", ^{
    describe(@"comparing CGRects", ^{
        it(@"should be possible", ^{
            CGRect thisRect = CGRectMake(10, 20, 30, 40);
            CGRect thatRect = CGRectMake(10, 20, 30, 40);

            thisRect should equal(thatRect);
        });

        it(@"should fail with a reasonable message", ^{
            expectFailureWithMessage(@"Expected <{{10, 20}, {30, 40}}> to equal <{{11, 22}, {33, 44}}>", ^{
                CGRect thisRect = CGRectMake(10, 20, 30, 40);
                CGRect thatRect = CGRectMake(11, 22, 33, 44);

                thisRect should equal(thatRect);
            });
        });
    });

    describe(@"comparing CGSizes", ^{
        it(@"should be possible", ^{
            CGSize thisSize = CGSizeMake(10, 20);
            CGSize thatSize = CGSizeMake(10, 20);

            thisSize should equal(thatSize);
        });

        it(@"should fail with a reasonable message", ^{
            expectFailureWithMessage(@"Expected <{10, 20}> to equal <{11, 22}>", ^{
                CGSize thisSize = CGSizeMake(10, 20);
                CGSize thatSize = CGSizeMake(11, 22);

                thisSize should equal(thatSize);
            });
        });
    });

    describe(@"comparing CGPoints", ^{
        it(@"should be possible", ^{
            CGPoint thisPoint = CGPointMake(10, 20);
            CGPoint thatPoint = CGPointMake(10, 20);

            thisPoint should equal(thatPoint);
        });

        it(@"should fail with a reasonable message", ^{
            expectFailureWithMessage(@"Expected <{10, 20}> to equal <{11, 22}>", ^{
                CGPoint thisPoint = CGPointMake(10, 20);
                CGPoint thatPoint = CGPointMake(11, 22);

                thisPoint should equal(thatPoint);
            });
        });
    });

    describe(@"comparing CGAffineTransforms", ^{
        it(@"should be possible", ^{
            CGAffineTransform thisTransform = CGAffineTransformMake(10, 20, 30, 40, 50, 60);
            CGAffineTransform thatTransform = CGAffineTransformMake(10, 20, 30, 40, 50, 60);

            thisTransform should equal(thatTransform);
        });

        it(@"should fail with a reasonable message", ^{
            expectFailureWithMessage(@"Expected <[10, 20, 30, 40, 50, 60]> to equal <[11, 22, 33, 44, 55, 66]>", ^{
                CGAffineTransform thisTransform = CGAffineTransformMake(10, 20, 30, 40, 50, 60);
                CGAffineTransform thatTransform = CGAffineTransformMake(11, 22, 33, 44, 55, 66);

                thisTransform should equal(thatTransform);
            });
        });
    });
});

SPEC_END
