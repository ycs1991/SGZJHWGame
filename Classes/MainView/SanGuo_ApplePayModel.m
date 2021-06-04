

#import "SanGuo_ApplePayModel.h"
#import <StoreKit/StoreKit.h>
#import <LCProgressHUD/LCProgressHUD.h>

@interface SanGuo_ApplePayModel ()<SKProductsRequestDelegate, SKPaymentTransactionObserver>
{
    NSString *buyProductId;
}
@end

@implementation SanGuo_ApplePayModel

- (void)sanguo_nextNavigatePaymentFun:(NSString *)productId quantity:(int)quantity sanguo_sendOrder:(NSString *)sanguo_sendOrder
{
    _sanguo_sendOrder=sanguo_sendOrder;
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [self buyProduct:productId];
}

- (void)sanguo_customizeImageTransactionFun
{
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

-(void)buyProduct:(NSString *)productId
{
    buyProductId = productId;
    if ([SKPaymentQueue canMakePayments]) {
        [self RequestProductData];
    }else {

        UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:@"Prompt"
                                                            message:@"Your phone is not open for in-app purchase"
                                                      delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alerView show];
    }
}

-(void)RequestProductData
{
    
    NSArray* transactions = [SKPaymentQueue defaultQueue].transactions;
    if (transactions.count > 0) {
        
        for (NSInteger i = 0; i < transactions.count; i ++) {
            SKPaymentTransaction *trans = transactions[i];
            NSLog(@"**********************************%@", trans);
            if (trans.transactionState == SKPaymentTransactionStatePurchased) {
                NSLog(@"-----------------You still have an outstanding order");
                [[SKPaymentQueue defaultQueue] finishTransaction:trans];
            }
        }
    }
   
    NSArray *product = [[NSArray alloc] initWithObjects:buyProductId,nil];
    NSSet *nsset = [NSSet setWithArray:product];
    SKProductsRequest *request=[[SKProductsRequest alloc] initWithProductIdentifiers: nsset];
    request.delegate=self;
    [request start];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSArray *myProduct = response.products;
    NSLog(@"myProduct ---======----- %@", myProduct);
    NSString* productId;
    for(SKProduct *product in myProduct)
    {
        productId=product.productIdentifier;
        SKMutablePayment *payment = [SKMutablePayment paymentWithProduct:product];
        payment.applicationUsername = _sanguo_sendOrder;
        NSLog(@"-------didReceiveResponse-------_sanguo_sendOrder %@", _sanguo_sendOrder);
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }

//    SKMutablePayment *payment = [SKMutablePayment paymentWithProductIdentifier:productId];
//    payment.applicationUsername=_sanguo_sendOrder;
//    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:@"Prompt" message:[error localizedDescription]
                                                       delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
    [alerView show];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"requestDidFailWithError" object:nil];
}

-(void) PurchasedTransaction: (SKPaymentTransaction *)transaction
{
    NSArray *transactions =[[NSArray alloc] initWithObjects:transaction, nil];
    [self paymentQueue:[SKPaymentQueue defaultQueue] updatedTransactions:transactions];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased: {
                [self completeTransaction:transaction];
                
            }
                break;
                
            case SKPaymentTransactionStateFailed:
            {
                [self failedTransaction:transaction];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [LCProgressHUD showFailure:@"Purchase failed"];
                });
//                UIAlertView *alerView2 =  [[UIAlertView alloc] initWithTitle:@"Prompt"
//                                                                     message:@"Purchase failed, please try again"
//                                                                    delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];                
//                [alerView2 show];
                
            }
                break;
                
            case SKPaymentTransactionStateRestored: {
                [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
            }
                break;
                
            case SKPaymentTransactionStatePurchasing:
            {

            }
                break;
                
            default:
                break;
        }
    }
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction
{

    NSString *product = transaction.payment.productIdentifier;
    NSString *order=transaction.payment.applicationUsername;
    NSString* transId=transaction.transactionIdentifier;
    NSMutableDictionary *userInfoDictionary =[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       transaction,@"transaction",nil];

    
    [userInfoDictionary setValue:order forKey:@"order"];
    [userInfoDictionary setValue:transId forKey:@"tid"];
     [userInfoDictionary setValue:product forKey:@"productId"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"completeTransaction" object:self userInfo:userInfoDictionary];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
    NSDictionary *userInfoDictionary =[NSDictionary dictionaryWithObjectsAndKeys:
                                       transaction,@"transaction",nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"failedTransaction" object:self userInfo:userInfoDictionary];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

-(void)dealloc
{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

+(instancetype)sanguo_characterCropShareFun
{
    static SanGuo_ApplePayModel *applePay;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        applePay = [[SanGuo_ApplePayModel alloc] init];
    });
    return applePay;
}


@end
