//
//  ViewController.m
//  Easy Share for iOS 6
//
//  Created by Michael MacCallum on 11/25/12.
//
//  Accreditation is not required, but is always appreciated.
//
//  This Software is provided on an "AS IS" basis.  I
//  MAKE NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
//  THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
//  OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//
//  IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
//  OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
//  MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
//  AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
//  STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
//  That being said, you are free to use this code free of charge for absolutely
//  anything you want. You may use this in personal projects, commercial projects
//  or for anything else.

#import "ViewController.h"
#import "UIViewController+easySharing.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)shareToUserSelection:(id)sender
{
    NSArray *itemsToShare = [[NSArray alloc] initWithObjects:[self sharingImage],[self sharingString],[self sharingURL], nil];
    [self easyShareServiceAgnosticWithInputObjects:itemsToShare];
}

- (IBAction)facebook:(id)sender {
    [self easyShareTextWithFacebook:[self sharingString]        //NSString
                           andImage:[self sharingImage]         //UIImage
                             andURL:[self sharingURL]];         //NSURL
}

- (IBAction)twitter:(id)sender {
    [self easyShareTextWithTwitter:[self sharingString]         //NSString
                          andImage:[self sharingImage]          //UIImage
                            andURL:[self sharingURL]];          //NSURL
}

- (IBAction)weibo:(id)sender {
    [self easyShareTextWithSinoWeibo:[self sharingString]       //NSString
                            andImage:[self sharingImage]        //UIImage
                              andURL:[self sharingURL]];        //NSURL
}

- (IBAction)textMessage:(id)sender {
    NSString *textMessageText = @"This is my awesome text message!";
    NSArray *recipients = [[NSArray alloc] initWithObjects:
                           @"1234567890",
                           @"0987654321",
                           @"2398483838",
                           nil];
    
    [self easyShareTextWithTextMessage:textMessageText          //NSString
                         andRecipients:recipients];             //NSArray
}

- (IBAction)email:(id)sender {
    [self easyShareBodyTextWithMail:@"body text"                                                            //NSString
                      andIsBodyHTML:NO                                                                      //BOOL
                      andRecipients:[NSArray arrayWithObjects:@"someEmailAddress@gmail.com", nil]           //NSArray
                    andCcRecipients:nil                                                                     //NSArray
                   andBccRecipients:nil                                                                     //NSArray
                         andSubject:@"subject"                                                              //NSString
                  andAttachmentData:UIImagePNGRepresentation([self sharingImage])                           //NSData
             attachmentDataMIMEtype:@"image/png"                                                            //NSString
             attechmentDataFileName:@"myImage.png"];                                                        //NSString
}

- (IBAction)copyToPasteboard:(id)sender {
    //Only one value for pasteboard can exist. Pass nil for the rest...
    [self easyShareCopyTextToPasteboard:nil                       //NSString
                               andImage:nil                       //UIImage
                                 andURL:[self sharingURL]         //NSURL
                               andColor:nil];                     //UIColor
}

- (IBAction)print:(id)sender {
    [self easyShareImageByPrinting:[self sharingImage]              //UIImage
                           andData:nil                              //NSData
                       andFilePath:nil                              //NSString
                            andURL:[self sharingURL]];              //NSURL
}

- (IBAction)saveToCameraRoll:(id)sender {
    [self easyShareSaveImageToCameraRoll:[self sharingImage]        //UIImage
                       andOrVideoFromURL:nil];                      //NSURL
}































































- (UIImage *)sharingImage {
    return [UIImage imageNamed:@"mySharingImage.jpg"];
}
- (NSString *)sharingString {
    return @"My awesome sharing text";
}
- (NSURL *)sharingURL {
    return [NSURL URLWithString:@"http://www.google.com/"];
}
- (UIColor *)sharingColor {
    return [UIColor colorWithRed:25.0f/255.0f green:55.0f/255.0f blue:245.0f/255.0f alpha:1.0f];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end