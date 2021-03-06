#if TARGET_OS_IPHONE
#import <Cedar/CDRSpecHelper.h>
#else
#import <Cedar/CDRSpecHelper.h>
#endif

extern "C" {
#import "ExpectFailureWithMessage.h"
}

using namespace Cedar::Matchers;

SPEC_BEGIN(BeSameInstanceAsSpec)

describe(@"be_same_instance_as matcher", ^{
    describe(@"when the actual value is not a pointer", ^{
        int actualValue = 1;
        int *expectedValue = nil;

        it(@"should fail with an exception", ^{
            expectFailureWithMessage(@"Attempt to compare non-pointer type for sameness.", ^{
                expect(actualValue).to(be_same_instance_as(expectedValue));
            });
        });
    });

    describe(@"when the actual value is a pointer", ^{
        int i = 17;
        int *actualValue = &i;

        describe(@"and the values point to the same address space", ^{
            int *expectedValue = actualValue;

            describe(@"positive match", ^{
                it(@"should pass", ^{
                    expect(actualValue).to(be_same_instance_as(expectedValue));
                });
            });

            describe(@"negative match", ^{
                it(@"should fail with a sensible failure message", ^{
                    expectFailureWithMessage([NSString stringWithFormat:@"Expected <%p> to not be same instance as <%p>", actualValue, expectedValue], ^{
                        expect(actualValue).to_not(be_same_instance_as(expectedValue));
                    });
                });
            });
        });

        describe(@"and the values do not point to the same address space", ^{
            int *expectedValue = nil;

            describe(@"positive match", ^{
                it(@"should fail with a sensible failure message", ^{
                    expectFailureWithMessage([NSString stringWithFormat:@"Expected <%p> to be same instance as <%p>", actualValue, expectedValue], ^{
                        expect(actualValue).to(be_same_instance_as(expectedValue));
                    });
                });
            });

            describe(@"negative match", ^{
                it(@"should pass", ^{
                    expect(actualValue).to_not(be_same_instance_as(expectedValue));
                });
            });
        });
    });
});

SPEC_END
